//
//  DetailController.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import UIKit
import AVFoundation
class DetailController: UIViewController {
    var playerView: PlayerView!
    var playerItem: AVPlayerItem!
    var avplayer: AVPlayer!
    var link: CADisplayLink!
    
    deinit {
        
        playerItem.removeObserver(self, forKeyPath: "loadedTimeRanges")
        playerItem.removeObserver(self, forKeyPath: "status")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ThemeBlackColor
        
        initPlayer()

        link = CADisplayLink(target: self, selector: #selector(updateTime))
        link.add(to: .main, forMode: .default)
        
    }
    func initPlayer()
    {
        playerView = PlayerView.init(frame: CGRect(x: 0, y: STATUSBAR_HEIGHT, width: view.frame.width, height: view.frame.width/16*9))
        playerView.delegate = self
        playerView.backgroundColor = ThemeBlackColor
        view.addSubview(playerView)
        //https://vd4.bdstatic.com/mda-igqy5ny4sn8uyby6/sc/mda-igqy5ny4sn8uyby6.mp4?auth_key=1564739152-0-0-7c8a2761260c09a1fab436cb2b53e9cc&bcevod_channel=searchbox_feed&pd=bjh&abtest=all
        let url = URL(string: "https://www.bombom999.top/bucket-test/VIDEOS/20201023/61f92cfde77c4c158689596ba5b8aaa4.mp4")

        playerItem = AVPlayerItem(url: url!)
        //缓冲进度，其他属性可去AVPlayerItem类里面查看
        playerItem.addObserver(self, forKeyPath: "loadedTimeRanges", options: .new, context: nil)
        //播放状态
        playerItem.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        
        avplayer = AVPlayer(playerItem: playerItem)
        
        (playerView.layer as! AVPlayerLayer).player = avplayer
        (playerView.layer as! AVPlayerLayer).videoGravity = .resizeAspect
        (playerView.layer as! AVPlayerLayer).contentsScale = UIScreen.main.scale
    }
    @objc func updateTime() {
        
        //暂停的时候
        if !playerView.playing{
            return
        }

        let currentTime = CMTimeGetSeconds(avplayer.currentTime())
        let totalTime = TimeInterval(playerItem.duration.value) / TimeInterval(playerItem.duration.timescale)
        let timeStr = "\(formatPlayTime(secounds: currentTime))/\(self.formatPlayTime(secounds: totalTime))"
        playerView.timeLabel.text = timeStr
        if !playerView.sliding{
            // 播放进度
            playerView.slider.value = Float(currentTime/totalTime)
        }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "loadedTimeRanges" {
        
            // 通过监听AVPlayerItem的"loadedTimeRanges"，可以实时知道当前视频的进度缓冲
            let loadedTime = avalableDurationWithplayerItem()
            let totalTime = CMTimeGetSeconds(playerItem.duration)
            let percent = loadedTime/totalTime // 计算出比例
            // 改变进度条
            playerView.progressView.progress = Float(percent)
        
        } else if keyPath == "status" {
        
            if  playerItem.status == .readyToPlay {
                
                avplayer.play()

            } else {
                print("加载异常")
            }
        }
    }

    func formatPlayTime(secounds: TimeInterval) -> String{
        
        if secounds.isNaN{
            
            return "00:00"
        }

        let min = Int(secounds / 60)
        let sec = Int(secounds.truncatingRemainder(dividingBy: 60) )
        return String(format: "%02d:%02d", min,sec)
    }
    // 计算当前缓冲进度
    func avalableDurationWithplayerItem() -> TimeInterval{

        guard let loadedTimeRanges = avplayer.currentItem?.loadedTimeRanges,let first = loadedTimeRanges.first else {fatalError()}
        let timeRange = first.timeRangeValue
        let startSeconds = CMTimeGetSeconds(timeRange.start)
        let durationSecound = CMTimeGetSeconds(timeRange.duration)
        let result = startSeconds + durationSecound
        return result
    }
    
    //旋转
    func toOrientation(orientation: UIInterfaceOrientation) {

        APPDELEGATE.isForcePortrait = false
        APPDELEGATE.isForceLandscapeRight = true
        _ = APPDELEGATE.application(UIApplication.shared, supportedInterfaceOrientationsFor: view.window)
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        playerView.frame.size.width = SCREEN_HEIGHT
        playerView.frame.size.height = SCREEN_WIDTH
        playerView.center = APPDELEGATE.window!.center
        
        playerView.updateUI()
        
    }
    
}
extension DetailController: PlayerViewDelegate {
    
    func player(playerView: PlayerView, slider: UISlider) {
        
        if avplayer.status == .readyToPlay {
        
            let duration = slider.value * Float(CMTimeGetSeconds(avplayer.currentItem!.duration))
            let seekTime = CMTimeMake(value: Int64(duration), timescale: 1)
            avplayer.seek(to: seekTime, completionHandler: { (b) in
                
                playerView.sliding = false
            })
        }
        
    }
    
    func player(playerView: PlayerView, playAndPause playBtn: UIButton) {
        
        if !playerView.playing{
            avplayer.pause()
        } else {
            if  avplayer.status == .readyToPlay {
                avplayer.play()
            }
        }
    }
    
    func player(playerView: PlayerView, backAction backBtn: UIButton) {
        
        if UIDevice.current.orientation == .portrait {
            
            //类似timer，退出时要停止使用
            link.invalidate()
            link = nil
            navigationController?.popViewController(animated: true)
        }
        else {
            //回复正常竖屏
            APPDELEGATE.isForcePortrait = true
            APPDELEGATE.isForceLandscapeRight = false
            _ = APPDELEGATE.application(UIApplication.shared, supportedInterfaceOrientationsFor: view.window)
            
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
            playerView.frame = CGRect(x: 0, y: STATUSBAR_HEIGHT, width: view.frame.width, height: view.frame.width/16*9)
            
            playerView.rotateBtn.isHidden = false
            
            playerView.updateUI()
        }
    }
    
    func player(playerView: PlayerView, rotateAction rotateBtn: UIButton) {
        
        playerView.rotateBtn.isHidden = true
        toOrientation(orientation: .landscapeRight)
    }
    
}
    


