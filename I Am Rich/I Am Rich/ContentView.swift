//
//  ContentView.swift
//  I Am Rich
//
//  Created by Гулнур  on 26.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
         
            Image("diamond")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
           
            Text("I Am Rich")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

