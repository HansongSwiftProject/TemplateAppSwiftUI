//
//  ScrollableSelector.swift
//  TemplateAppSwift
//
//  Created by hansong on 11/7/20.
//

import SwiftUI

struct ScrollableSelector: View {
    let items:[String]
    @Binding var selection:Int
    func text(for index:Int) -> some View {
        Group{
            if index == selection {
                Text(items[index])
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(4)
                    .background(Color.steam_gold)
                    .cornerRadius(8)
                    .onTapGesture{
                        self.selection = index
                    }
            }else{
                Text(items[index])
                    .font(.headline)
                    .foregroundColor(.primary)
                    .onTapGesture{
                        self.selection = index
                    }
            }
        }
    }
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators:false){
            HStack(alignment: .center, spacing:12, content: {
                ForEach(0 ..< items.count,id: \.self){
                    self.text(for: $0).id($0)
                }
            })
            .padding([.leading,.trailing],4)
        }
        .frame(height:36)
        .background(Color.steam_background)
        .cornerRadius(8)
        .padding()
        
    }
}
#if DEBUG
struct ScrollableSelector_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableSelector(items: ["Menu 1",
                                   "Menu 2",
                                   "Menu 3",
                                   "Menu 4",
                                   "Menu 5",
                                   "Menu 6",
                                   "Menu 7",
                                   "Menu 8"], selection: .constant(1))
    }
}
#endif
