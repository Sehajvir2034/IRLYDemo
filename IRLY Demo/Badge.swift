//
//  Badge.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-24.
//

import SwiftUI

struct Badge: View {
    var name: String
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var badge_bg_color : Color = Color(#colorLiteral(red: 1, green: 0.9254487157, blue: 0.7100584507, alpha: 1))
       
       var body: some View {
               Text(name)
                   .font(Font.system(size: 16))
                   .lineLimit(1)
                   .padding(.horizontal, 15)
                   .padding(.vertical, 5)
                   .background(badge_bg_color)
                   .cornerRadius(25) 
       }
}

#Preview {
    Badge(name: "Art")
}
