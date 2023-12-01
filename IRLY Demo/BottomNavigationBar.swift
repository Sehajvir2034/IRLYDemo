//
//  BottomNavigationBar.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-29.
//

import SwiftUI

struct BottomNavigationBar: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var about_bg : Color = Color(#colorLiteral(red: 1, green: 0.9627808928, blue: 0.9022616744, alpha: 1))
    var message_fill_color : Color = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    
    var body: some View {
            HStack (alignment: .center, spacing: 0, content: {
                Button(action: {}, label: {
                    Image(systemName: "person.fill")
                        .font(.title2)
                        .padding(.horizontal, 20)
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color(Color.black))
                        .font(.title2)
                        .padding(.horizontal, 20)
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "h.square.fill")
                        .foregroundStyle(Color(Color.black))
                        .font(.title)
                        .padding(.horizontal, 20)
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(Color(Color.black))
                        .font(.title2)
                        .padding(.horizontal, 20)
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "message.fill")
                        .foregroundStyle(Color(Color.black))
                        .font(.title2)
                        .padding(.horizontal, 20)
                })
                .buttonStyle(PlainButtonStyle())
            })
            .padding(.vertical,15)
            .background(Color(about_bg))
            .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    BottomNavigationBar()
}
