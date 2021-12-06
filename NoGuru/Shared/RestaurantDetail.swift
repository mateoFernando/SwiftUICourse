//
//  RestaurantDetail.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 25/11/21.
//

import SwiftUI

struct RestaurantDetail: View {
    var restaurant: Restaurant = restaurants[0]
    var namespace: Namespace.ID
    #if os(iOS)
    var cornerRadius: CGFloat = 10
    #else
    var cornerRadius: CGFloat = 0
    #endif
    @State var showModal = false
    var body: some View {
        #if os(iOS)
        content
            .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
        
    }
    
    var content: some View {
        VStack {
            ScrollView {
                RestaurantItem(restaurant: restaurant, cornerRadius: 0)
                    .matchedGeometryEffect(id: restaurant.id, in: namespace)
                    .frame(height: 300)
                VStack {
                    ForEach(courseSections) { item in
                        RestaurantRow(item: item)
                            .sheet(isPresented: $showModal) {
                                CourseSectionDetail()
                            }
                            .onTapGesture {
                                showModal = true
                            }
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(restaurant.id)", in: namespace)
    }
}

struct RestaurantDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        RestaurantDetail(namespace: namespace)
    }
}
