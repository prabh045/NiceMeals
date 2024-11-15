//
//  DirectionsView.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 24/09/24.
//

import SwiftUI

struct DirectionsView: View {
    let directions: String
    init() {
        self.directions = "Preheat the oven to 150C/300F/Gas 2.\r\nToss the beef and flour together in a bowl with some salt and black pepper.\r\nHeat a large casserole until hot, add half of the rapeseed oil and enough of the beef to just cover the bottom of the casserole.\r\nFry until browned on each side, then remove and set aside. Repeat with the remaining oil and beef.\r\nReturn the beef to the pan, add the wine and cook until the volume of liquid has reduced by half, then add the stock, onion, carrots, thyme and mustard, and season well with salt and pepper."
            .replacingOccurrences(of: "\n", with: "\n\n")
    }
    init(directions: String) {
        var directions = directions.replacingOccurrences(of: "\r\n\r\n", with: "\r\n")
        directions = directions.replacingOccurrences(of: "\n", with: "\n\n")
        self.directions = directions
    }
    var body: some View {
        ScrollView {
            HStack {
                Text("DIRECTIONS")
                    .font(.system(size: 16))
                    .bold()
                Rectangle()
                    .frame(width: 15, height: 2)
                    .foregroundStyle(.orange)
                Spacer()
            }
            Text(directions)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                .fontDesign(.serif)
        }
        .padding()
    }
}

#Preview {
    DirectionsView()
}
