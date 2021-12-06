//
//  Sidebar.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 24/11/21.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("Menú")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image(systemName: "person.crop.circle")
                    }
                })
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
                
            #endif
            RestauranteView()
        }
    }
    var content: some View{
        List{
            NavigationLink(destination: RestauranteView()) {
                Label("Restaurantes", systemImage: "cart")
            }
            Label("Favoritos", systemImage:"star")
            Label("Perfil", systemImage:"person.crop.circle")
            Label("Recomiendanos", systemImage:"quote.bubble")
        }
        .listStyle(SidebarListStyle())
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
