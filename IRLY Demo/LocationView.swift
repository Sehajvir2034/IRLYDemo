//
//  LocationView.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-29.
//

import SwiftUI

struct LocationView: View {
    let location: String
    let firstName: String
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var about_bg : Color = Color(#colorLiteral(red: 1, green: 0.9627808928, blue: 0.9022616744, alpha: 1))
    var text_color : Color = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    var text_color2 : Color = Color(#colorLiteral(red: 0.3394248188, green: 0.3655807674, blue: 0.4034335613, alpha: 0.2702130682))
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack (alignment: .topLeading){
            VStack (alignment: .leading){
                HStack{
                    
                    Image(systemName: "mappin.circle.fill")
                        .frame(alignment: .leading)
                        .font(.system(size: 18))
                        .foregroundStyle(text_color)
                        .padding(.top,20)
                        .padding(.leading,20)
                    
                    Text("\(firstName)'s Location")
                        .frame(alignment: .leading)
                        .font(.system(size: 18))
                        .foregroundStyle(text_color)
                        .padding(.top,20)
                    
                }
                
                Text("\(location)")
                    .frame(alignment: .leading)
                    .font(.system(size: 18))
                    .bold()
                    .foregroundStyle(Color.black)
                    .padding(.top,10)
                    .padding(.leading,25)
                    .padding(.bottom,20)
                
            }
            
            
        }
        .frame(width: screenWidth * 0.95, alignment: .leading)
        .background(about_bg)
    }
}

#Preview {
    LocationView(location: "Toronto", firstName: "Sehajvir")
}
