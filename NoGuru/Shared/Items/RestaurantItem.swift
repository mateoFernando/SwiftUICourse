//
//  RestaurantItem.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 24/11/21.
//

import SwiftUI

struct RestaurantItem: View {
    var restaurant: Restaurant = restaurants[0]
    #if os(iOS)
    var cornerRadius: CGFloat = 22
    #else
    var cornerRadius: CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack{
                Spacer()
                Image(restaurant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text(restaurant.title)
                .fontWeight(.bold)
            Text(restaurant.subtitle)
                .font(.footnote)
        }
        .padding(.all)
        .cardStyle(color: restaurant.color, cornerRadius: cornerRadius)
    }
}

struct RestaurantItem_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItem()
    }
}
