//
//  ContentView.swift
//  Shared
//
//  Created by Fernando Daniel Mateo Ramos on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif

    @ViewBuilder
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            RestauranteView()
        } else {
            RestauranteView()
        }
        #else
        Sidebar()
            .frame(minWidth: 1000, minHeight:600)
        #endif
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
