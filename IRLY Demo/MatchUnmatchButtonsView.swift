//
//  MatchUnmatchButtonsView.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-29.
//

import SwiftUI

struct MatchUnmatchButtonsView: View {
    
    var onAdd: () -> Void
    var onRemove: () -> Void
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var about_bg : Color = Color(#colorLiteral(red: 1, green: 0.9627808928, blue: 0.9022616744, alpha: 1))
    var hide_report_button_bg : Color = Color(#colorLiteral(red: 0.9042102695, green: 0.9042102695, blue: 0.9042102695, alpha: 1))
    let buttons: [String] = ["multiply", "star.fill", "heart.fill"]
    let buttonColors: [Color] = [.black, .pink, .yellow]
    
    var body: some View {
        HStack{
            
            ForEach(buttons.indices){ index in
                Spacer()
                
                Button {
                    if buttons[index] == "heart.fill" {
                        onAdd()
                    } else if buttons[index] == "multiply" {
                        onRemove()
                    }
                } label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 65, height: 65)
                        .shadow(radius: 5)
                        .overlay(
                            Image(systemName: "\(buttons[index])")
                                .font(.title)
                                .foregroundStyle(buttonColors[index])
                        )
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, buttons[index] == "star.fill" ? 100 : 0)
                
                Spacer()
            }
            
        }
        .frame(width: screenWidth * 0.95)
        .padding(.top, 50)
        .background(Color(about_bg))
        .cornerRadius(25.0, corners: [.bottomLeft, .bottomRight])
        .padding(.bottom,20)
        
        Button {
            
        } label: {
            Text("Hide and Report")
                .padding(.vertical,10)
                .frame(width: screenWidth * 0.95)
                .font(.system(size: 18))
                .foregroundStyle(Color(Color.red))
                .background(hide_report_button_bg)
                .cornerRadius(15)
        }
        .buttonStyle(PlainButtonStyle())
        
        Button {
            
        } label: {
            Text("Recommend to a Friend")
                .padding(.vertical,10)
                .frame(width: screenWidth * 0.95)
                .font(.system(size: 18))
                .foregroundStyle(Color(Color.black))
                .background(hide_report_button_bg)
                .cornerRadius(15)
        }
        .padding(.top,20)
        .padding(.bottom,20)
        .buttonStyle(PlainButtonStyle())
    }
}



#Preview {
    MatchUnmatchButtonsView(onAdd: { print("Add") }, onRemove: { print("Remove") })
}
