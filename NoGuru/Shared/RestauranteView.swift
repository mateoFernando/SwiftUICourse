//
//  RestauranteView.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 23/11/21.
//

import SwiftUI

struct RestauranteView: View {
    @State var show = false
    @Namespace var namespace
    @Namespace var namespace2
    @State var selectedItem: Restaurant? = nil
    @State var isDisable = false
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    var body: some View {
        ZStack{
            #if os(iOS)
            if horizontalSizeClass == .compact {
                tabBar
            }
            else {
                sideBar
            }
            fullcontent
                .background(VisualEffectBlur(blurStyle: .systemThickMaterial).edgesIgnoringSafeArea(.all))
            #else
            content
            fullcontent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationTitle("Restaurantes")
    }
      
    var content: some View {
        ScrollView {
            VStack(spacing: 0) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                          spacing: 16) {
                    ForEach(restaurants) { item in
                        VStack {
                            RestaurantItem(restaurant: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisable = true
                                    }
                                }
                                .disabled(isDisable)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
                Text("Lastest sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        #if os(iOS)
                        NavigationLink(destination: RestaurantDetail(namespace: namespace2)) {
                            RestaurantRow(item: item)
                        }
                        #else
                        RestaurantRow(item: item)
                        #endif
                    }
                }
                .padding()
            }
            
        }
        .zIndex(1)
        .navigationTitle("Restaurantes")
    }
    
    
    @ViewBuilder
    var fullcontent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                RestaurantDetail(restaurant: selectedItem!, namespace: namespace)
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisable = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
    
    var tabBar: some View {
        
        TabView{
            NavigationView {
                content
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
    
    @ViewBuilder
    var sideBar: some View {
        #if os(iOS)
        NavigationView {
            List{
                NavigationLink(destination: content) {
                    Label("Restaurantes", systemImage: "cart")
                }
                Label("Favoritos", systemImage:"star")
                Label("Perfil", systemImage:"person.crop.circle")
                Label("Recomiendanos", systemImage:"quote.bubble")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Menú")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "person.crop.circle")
                }
            }
            
            content
        }
        #endif
    }
    
}

struct RestauranteView_Previews: PreviewProvider {
    static var previews: some View {
        RestauranteView()
    }
}
