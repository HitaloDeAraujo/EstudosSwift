//
//  ContentView.swift
//  SwiftUIStackView
//
//  Created by admin on 20/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack (alignment: .leading, spacing: 50){
//            Text("Ola")
//            Text("Swift")
//            .padding()
//        }
//        .font(.largeTitle)
        
        HStack(spacing: 20){
            Text("iMac")
            Text("iPad")
            Text("iPhone")
            Text("Watch")
        }
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
