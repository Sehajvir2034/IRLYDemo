//
//  ContentView.swift
//  IRLY Demo
//
//  Created by Sehajvir Singh Pannu on 2023-11-21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var people: [Person] = [
        Person(
            id: "001",
            firstName: "Alice",
            lastName: "Johnson",
            age: 29,
            images: ["alice1", "alice2","alice3", "alice4"],
            interests: [ "Hiking", "Photography", "Cooking"],
            basicInfo: ["154 cm", "Woman", "Straight","Caucasian","Social Drinker","Atheist", "Apolitical","Loves traveling"],
            additionalInfo: ["Lululemon","Sales Associate" ,"UOT", "Monogamy", "English/French", "Looking for a long term relationship"],
            location: "San Francisco",
            bio: "Outdoor enthusiast and amateur photographer. Passionate about cooking and sustainability."
        ),
        Person(
            id: "002",
            firstName: "Sehajvir",
            lastName: "Pannu",
            age: 23,
            images: ["Image1", "Image10","Image11"],
            interests: ["Music", "Technology", "Gardening"],
            basicInfo: ["175 cm","Man", "Straight", "Social Drinker","Non-smoker", "Tech enthusiast"],
            additionalInfo: ["Software Developer", "Netflix", "UBC", "Non-Monogamy", "English", "Looking for something casual"],
            location: "New York",
            bio: "Music lover and tech geek. I enjoy exploring the city and growing my own herbs."
        ),
        Person(
            id: "003",
            firstName: "John",
            lastName: "Davis",
            age: 32,
            images: ["Image6", "Image7", "Image8", "Image9"],
            interests: ["Reading", "Yoga", "Art"],
            basicInfo: ["Cat person", "Freelance writer"],
            additionalInfo: ["Software Developer", "Netflix", "COL", "Non-Monogamy", "English", "Looking for something casual"],
            location: "Austin",
            bio: "Yoga and meditation are my go-to for relaxation. Love getting lost in a good book."
        )
    ]

    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    
    var body: some View {
        VStack {
            TopNavigationBar()
            
            Spacer()
            
            ZStack{
                ForEach (people){ person in
                    CardView(person: person)
                }
            }
            .padding(.bottom,70)
            
            Spacer()
            
            BottomNavigationBar()
                .ignoresSafeArea(edges: .bottom)

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
    }
}

class Person: Identifiable {
    var id: String
    var firstName: String
    var lastName: String
    var images: [String]
    var interests: [String]
    var basicInfo: [String]
    var additionalInfo: [String]
    var location: String
    var bio: String
    var age: Int
    
    init(id: String, firstName: String, lastName: String, age: Int, images: [String], interests: [String], basicInfo: [String], additionalInfo: [String], location: String, bio: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.images = images
        self.interests = interests
        self.basicInfo = basicInfo
        self.additionalInfo = additionalInfo
        self.location = location
        self.bio = bio
        self.age = age
    }
}

#Preview {
    ContentView()
    
}
