//
//  RestaurantRow.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 23/11/21.
//

import SwiftUI

struct RestaurantRow: View {
    var item: CourseSection = courseSections[0]
    
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(item.logo)
                .renderingMode(.original)
                .imageScale(.medium)
                .frame(width: 48, height: 48)
                .background(item.color)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("0.3 Km")
                    .font(.caption)
            }
            .padding(.all, 20.0)
            Spacer()
        }
    }
}

struct RestaurantRow_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRow()
    }
}
