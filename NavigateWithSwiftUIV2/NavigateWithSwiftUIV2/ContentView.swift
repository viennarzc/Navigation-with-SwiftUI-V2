//
//  ContentView.swift
//  NavigateWithSwiftUIV2
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
@EnvironmentObject var navigationHelper: NavigationHelper

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Text("Second View"), tag: "Second", selection: $navigationHelper.selection) { EmptyView() }
                NavigationLink(destination: DetailView(), tag: "Third", selection: $navigationHelper.selection) { EmptyView() }
                Button("Tap to show second") {
                    self.navigationHelper.selection = "Second"
                }
                Button("Tap to show third") {
                    self.navigationHelper.selection = "Third"
                }
            }
            .navigationBarTitle("Navigation")
        }
    }
}

class NavigationHelper: ObservableObject {
    @Published var selection: String? = nil
}


struct DetailView: View {
    @EnvironmentObject var navigationHelper: NavigationHelper
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: Text("Fourth View"), tag: "Fourth", selection: $navigationHelper.selection) { EmptyView() }
            
            Button {
                navigationHelper.selection = "Fourth"
            } label: {
                Text("Go to Fourth")
            }

        }
    }
}
