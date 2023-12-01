//
//  MyBasicsView.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-28.
//

import SwiftUI

struct MyBasicsView: View {
    var basicInfo: [String]
    var additionalInfo: [String]
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var about_bg : Color = Color(#colorLiteral(red: 1, green: 0.9627808928, blue: 0.9022616744, alpha: 1))
    var text_color : Color = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    var text_color2 : Color = Color(#colorLiteral(red: 0.3394248188, green: 0.3655807674, blue: 0.4034335613, alpha: 0.2702130682))
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack (alignment: .topLeading){
            VStack (alignment: .leading){
                Text("My Basics")
                    .frame(alignment: .leading)
                    .font(.system(size: 18))
                    .foregroundStyle(text_color)
                    .padding(.top,20)
                    .padding(.leading,20)
                
                ScrollView(.horizontal, showsIndicators: false,
                           content:{
                    HStack{
                        
                        ForEach(Array(basicInfo.enumerated()), id: \.element) { index, basicinfo in
                            Badge(name: "\(basicinfo)")
                            
                            if index != basicInfo.count - 1 {
                                Divider().frame(height: 30).background(text_color2)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                )
                .highPriorityGesture(
                    DragGesture(), including: .gesture
                )
                
                Rectangle()
                    .frame(width: screenWidth * 0.95, height: 0.45)
                       .foregroundStyle(Color(text_color2))
                       .padding(.vertical,5)
                
                VStack (alignment:.leading){
                    
                    ForEach(Array(additionalInfo.enumerated()), id: \.element) { index, additionalinfo in
                        Text("\(additionalinfo)")
                            .font(.system(size: 16))
                            .foregroundStyle(text_color)
                            .padding(.horizontal, 20)

                        if index != additionalInfo.count - 1 {
                            Rectangle()
                                .frame(width: screenWidth * 0.85, height: 0.45)
                                .foregroundStyle(Color(text_color2))
                                .padding(.vertical, 5)
                                .padding(.horizontal, 20)
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.bottom,20)
            }
            
            
            
        }
        .frame(width: screenWidth * 0.95, alignment: .leading)
        .background(about_bg)
    }
}

#Preview {
    MyBasicsView(basicInfo: ["172 cm", "Man"], additionalInfo: ["UBC", "Sofware Dev", "Ludhiana"])
}
