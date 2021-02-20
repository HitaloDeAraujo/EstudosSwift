//
//  HomeView.swift
//  SwiftUITabView
//
//  Created by admin on 20/02/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.yellow
            .edgesIgnoringSafeArea(.all)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
