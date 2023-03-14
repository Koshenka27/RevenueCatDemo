//
//  TabBar.swift
//  RevenueCatDemo
//
//  Created by Logan Koshenka on 3/14/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.slash")
                        Text("Free")
                    }
                }
            ProView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Pro")
                    }
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
