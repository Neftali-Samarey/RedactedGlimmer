//
//  ContentView.swift
//  ShimmeringRedacted
//
//  Created by Neftali Samarey on 9/27/22.
//

import SwiftUI

struct ContentView: View {

    @State var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            Image("Portrait")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300)
                .cornerRadius(3)
                .redacted(reason: isLoading ? .placeholder : [])
                .glimmering(active: isLoading)

            Text("by")
                .italic()
                .unredacted()

            Text("Alison Green")
                .frame(width: 320, height: 24)
                .font(.title2)
                .redacted(reason: isLoading ? .placeholder : [])
                .glimmering(active: isLoading)
        }
        .onAppear(perform: {
            simulateNetworkCall()
        })
    }

    func simulateNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
