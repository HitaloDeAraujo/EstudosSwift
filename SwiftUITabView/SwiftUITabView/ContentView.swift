//
//  ContentView.swift
//  SwiftUITabView
//
//  Created by admin on 20/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "1.circle")
                        Text("Home")
                    }
                }.tag(1)
            
            AboutView()
                .tabItem {
                    VStack {
                        Image(systemName: "2.circle")
                        Text("About")
                    }
                }.tag(2)
        }.accentColor(.black)
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
