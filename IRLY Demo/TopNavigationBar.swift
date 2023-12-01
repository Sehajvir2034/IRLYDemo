//
//  TopNavigationBar.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-29.
//

import SwiftUI

struct TopNavigationBar: View {
    var body: some View {
        
        HStack (alignment: .top, spacing: 0, content: {
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(Color(Color.black))
                    .font(.title)
                    .padding(.leading, 20)
                    .padding(.top,5)
                    
            })
            .buttonStyle(PlainButtonStyle())
            Spacer()
            Text("HUMBLE")
                .font(.title2)
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundStyle(Color(Color.black))
                    .font(.title2)
                    .padding(.trailing, 20)
            })
            .buttonStyle(PlainButtonStyle())
        })
        .padding(.vertical,15)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TopNavigationBar()
}
