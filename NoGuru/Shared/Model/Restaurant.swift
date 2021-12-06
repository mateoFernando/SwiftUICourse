//
//  Restaurant.swift
//  NoGuru
//
//  Created by Fernando Daniel Mateo Ramos on 25/11/21.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var color: Color
}

var restaurants = [
    Restaurant(
        title: "Restaurante Huanchaco",
        subtitle: "2 Km",
        image: "Illustration 1",
        color: Color(#colorLiteral(red: 0, green: 0.5217629075, blue: 1, alpha: 1))
    ),
    Restaurant(
        title: "Fasfú",
        subtitle: "3 Km",
        image: "Illustration 2",
        color: Color(#colorLiteral(red: 0.3150139749, green: 0, blue: 0.8982304931, alpha: 1))
    ),
    Restaurant(
        title: "Bolichera 21",
        subtitle: "4 Km",
        image: "Illustration 3",
        color: Color(#colorLiteral(red: 0, green: 0.7283110023, blue: 1, alpha: 1))
    ),
    Restaurant(
        title: "La Mar",
        subtitle: "5 Km",
        image: "Illustration 4",
        color: Color(#colorLiteral(red: 0.9467853904, green: 0.2021691203, blue: 0.3819385171, alpha: 1))
    ),
    Restaurant(
        title: "Polleria del Callao",
        subtitle: "6 Km",
        image: "Illustration 5",
        color: Color(#colorLiteral(red: 0.9721538424, green: 0.2151708901, blue: 0.5066347718, alpha: 1))
    ),
    Restaurant(
        title: "Chifa Kong",
        subtitle: "7 Km",
        image: "Illustration 6",
        color: Color(#colorLiteral(red: 1, green: 0.3477956653, blue: 0.3974102139, alpha: 1))
    ),
    Restaurant(
        title: "Cuto",
        subtitle: "8 Km",
        image: "Illustration 7",
        color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    ),
    Restaurant(
        title: "Mi Barrunto",
        subtitle: "9 Km",
        image: "Illustration 8",
        color: Color(#colorLiteral(red: 0.1446507573, green: 0.8378821015, blue: 0.9349924922, alpha: 1))
    )
]

    
