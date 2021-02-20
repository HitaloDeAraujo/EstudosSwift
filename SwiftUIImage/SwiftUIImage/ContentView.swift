//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by admin on 20/02/21.
//

import SwiftUI

struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("Credit: Ricardo Gomez Angel")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack{
            Text("Coleção de Outono")
                .font(.largeTitle)
            
            Image("outono")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250, alignment: .center)
                .border(Color.red, width: 3.0)
                //.clipShape(Circle())
                .overlay(ImageOverlay(), alignment: .bottomTrailing)
                .clipped()
            
            Spacer()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
