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
        NavigationView {
            ScrollView {
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

                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.body)
                        .redacted(reason: isLoading ? .placeholder : [])
                        .glimmering(active: isLoading)
                        .padding()
                }
                .onAppear(perform: {
                    simulateNetworkCall()
                })
            }
            .navigationTitle("Hiking Day")
            .padding()
        }
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
