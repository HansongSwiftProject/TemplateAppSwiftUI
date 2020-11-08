//
//  TemplateAppSwiftApp.swift
//  TemplateAppSwift
//
//  Created by hansong on 11/7/20.
//

import SwiftUI
import SwiftUIFlux

let  store = Store<AppState>(reducer: appStateReducer,
                             middleware: [loggingMiddleware],
                             state: AppState())


@main
struct TemplateAppSwiftApp: App {
    
    let archiveTimer:Timer
    
    init() {
        archiveTimer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true, block: { _ in
            store.state.archiveState()
        })
        setupApperance()
    }
    
    private func setupApperance() {}
    
    var body: some Scene {
        WindowGroup {
            StoreProvider(store: store) {
                TabbarView().accentColor(.steam_gold)
            }
        }
    }
}
let sampleCustomList = CustomList(id: 0,
                                  name: "TestName",
                                  cover: 0,
                                  movies: [0])
let sampleStore = Store<AppState>(reducer: appStateReducer,
                                  state: AppState(moviesState:
                                                    MoviesState(movies: [0: sampleMovie],
                                                                moviesList: [MoviesMenu.popular: [0]],
                                                                recommended: [0: [0]],
                                                                similar: [0: [0]],
                                                                customLists: [0: sampleCustomList]),
                                                  peoplesState: PeoplesState(peoples: [0: sampleCasts.first!, 1: sampleCasts[1]],
                                                                             peoplesMovies: [:],
                                                                             search: [:])))

