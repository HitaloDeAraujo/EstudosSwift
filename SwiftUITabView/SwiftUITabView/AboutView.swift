//
//  AboutView.swift
//  SwiftUITabView
//
//  Created by admin on 20/02/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack{
            Color.green
            .edgesIgnoringSafeArea(.all)
            Text("About View")
            .font(.largeTitle)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
