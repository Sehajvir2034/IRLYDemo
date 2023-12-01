//
//  AboutSectionView.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-24.
//

import SwiftUI

struct AboutSectionView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var about_bg : Color = Color(#colorLiteral(red: 1, green: 0.9627808928, blue: 0.9022616744, alpha: 1))
    var text_color : Color = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    var bio : String
    
    var body: some View {
        ZStack (alignment: .topLeading){
            VStack (alignment: .leading){
                HStack{
                    
                    Text("About Me")
                        .frame(alignment: .leading)
                        .font(.system(size: 20))
                        .foregroundStyle(text_color)
                        .padding(.top,20)
                        .padding(.leading,25)
                    
                }
                
                Text(bio)
                    .frame(alignment: .leading)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.black)
                    .padding(.top,10)
                    .padding(.horizontal,25)
                    .padding(.bottom,20)
                
            }
            
            
        }
        .frame(width: screenWidth * 0.95, alignment: .leading)
        .padding(.bottom,10)
        .background(about_bg)
    }
}

#Preview {
    AboutSectionView(bio: "Some Demo bio here. Some Demo bio here. Some Demo bio here. Some Demo bio here ")
}
