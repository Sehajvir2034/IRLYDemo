//
//  CardView.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-21.
//

import SwiftUI

struct CardView: View {
    
    var person: Person
    
    @State private var offset = CGSize.zero
    @State private var color: Color = .white
    @State private var isAtTop = false
    
    private let horizontalDragThreshold: CGFloat = 5
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var about_bg : Color = Color(#colorLiteral(red: 1, green: 0.9627808928, blue: 0.9022616744, alpha: 1))
    var text_color : Color = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:screenWidth * 0.95, height: screenHeight * 0.7)
                .cornerRadius(25.0, corners: .allCorners)
                .foregroundColor(color.opacity(1.0))
            ScrollView (.vertical, showsIndicators: false) {
                    ZStack(alignment: .bottomLeading) {
                        VStack(spacing: 0) {
                            if let firstImage = person.images.first {
                                               imageAndNameView(imageName: firstImage, firstName: person.firstName, lastName: person.lastName, age: person.age)
                                           }
                            
                            
                            AboutSectionView(bio: person.bio)
                            
                            if person.images.count > 1 {
                                Image(person.images[1]) // Access the second image directly
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: screenWidth * 0.95, height: screenHeight * 0.7)
                                    .padding(0)
                            }
                            
                            InterestsView(interests: person.interests)
                            
                            MyBasicsView(basicInfo: person.basicInfo, additionalInfo: person.additionalInfo)
                            
                            if person.images.count > 2 {
                                ForEach(person.images.dropFirst(2), id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: screenWidth * 0.95, height: screenHeight * 0.7)
                                        .padding(0)
                                }
                            }
                            
                            LocationView(location: person.location, firstName: person.firstName)
                            
                            MatchUnmatchButtonsView(
                                onAdd: {
                                    print("\(person.firstName) \(person.lastName) was added")
                                        },
                                onRemove: {
                                    print("\(person.firstName) \(person.lastName) was removed")
                                        }
                            )
                               
                    }
                }
            }
            .frame(width: screenWidth * 0.95, height: screenHeight * 0.7)
            .cornerRadius(25.0, corners: .allCorners)
            
        }
        .offset(x:offset.width, y: 0)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                if abs(gesture.translation.width) > horizontalDragThreshold {
                    offset = gesture.translation
                    withAnimation {
                        }
                    }
                }
                .onEnded { _ in
                    withAnimation {
                    swipeCard(width: offset.width)
                }
                }
        )
    }
    
    private func imageAndNameView(imageName: String, firstName: String, lastName: String, age: Int) -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenWidth * 0.95, height: screenHeight * 0.7)
                .cornerRadius(25, corners: [.topLeft, .topRight])

            Text("\(firstName) \(lastName), \(age)")
                .font(.title)
                .foregroundColor(Color.white)
                .padding()
        }
        .frame(width: screenWidth * 0.95, height: screenHeight * 0.7)
        .zIndex(1.0)
    }
    
    func swipeCard(width: CGFloat){
        switch width{
        case -500...(-150):
            print("\(person.firstName) \(person.lastName) was removed")
            offset = CGSize(width:-500, height:0)
            
        case 150...500:
            print("\(person.firstName) \(person.lastName) was added")
            offset = CGSize(width:500, height:0)
            
        default:
            offset = .zero
        }
    }
    func swipeRight() {
            withAnimation {
                offset = CGSize(width: 500, height: 0)
                print("\(person.firstName) \(person.lastName) was added")
        }
    }

    func swipeLeft() {
        withAnimation {
            offset = CGSize(width: -500, height: 0)
            print("\(person.firstName) \(person.lastName) was removed")
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    CardView(person: Person(id: "0001", firstName: "Sehajvir", lastName: "Pannu", age: 23, images: ["Image1", "Image10","Image11"], interests: ["Hiking", "Sketching", "Coding", "Rock Climbing"], basicInfo: ["175 cm", "Man", "Monogamy"],additionalInfo: ["Software Dev", "UBC", "Ludhiana", "Long-Term"], location: "Vancouver", bio: "This is some bio. This is some bio. This is some bio. This is some bio."))
}
