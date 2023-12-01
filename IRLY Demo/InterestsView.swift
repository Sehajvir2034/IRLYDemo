//
//  InterestsView.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-24.
//

import SwiftUI

struct InterestsView: View {
    
    var interests: [String]

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var about_bg : Color = Color(#colorLiteral(red: 1, green: 0.9627808928, blue: 0.9022616744, alpha: 1))
    var text_color : Color = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack (alignment: .topLeading){
            VStack (alignment: .leading){
                Text("Interests")
                    .frame(alignment: .leading)
                    .font(.system(size: 20))
                    .foregroundStyle(text_color)
                    .padding(.top,20)
                    .padding(.leading,20)
                
                ScrollView(.horizontal, showsIndicators: false,
                           content:{
                    HStack{
                        ForEach(interests, id: \.self) { interest in
                                    Badge(name: interest)
                        }
                    
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom,20)
                }
                )
                .highPriorityGesture(
                    DragGesture(), including: .gesture
                )
            }
            
            
            
        }
        .frame(width: screenWidth * 0.95, alignment: .leading)
        .background(about_bg)
        
        
        
    }
}

#Preview {
    InterestsView(interests: ["Hello", "World"])
}
