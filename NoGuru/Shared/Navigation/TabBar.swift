//
//  TabBar.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 29/11/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            NavigationView {
                RestauranteView()
            }
            .tabItem {
                Image(systemName: "cart")
                Text("Restaurantes")
            }
             
            NavigationView {
                RestaurantList()
            }
            .tabItem {
                Image(systemName: "star")
                Text("Favoritos")
            }
            
            NavigationView {
                RestaurantList()
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            
            NavigationView {
                RestaurantList()
            }
            .tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            
            NavigationView {
                RestaurantList()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
