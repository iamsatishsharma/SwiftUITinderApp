//
//  CardView.swift
//  SwiftUITinderApp
//
//  Created by Satish Sharma on 30/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeAndNope = .none
    
    private var thresholdPercentage: CGFloat = 0.4
    private var user: User
    private var onRemove: (_ user: User) -> Void
    
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
           self.user = user
           self.onRemove = onRemove
       }
       
    //Percentage of width have we swipped
    //Parameters:
    //geometry: The geometry
    //gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
         GeometryReader { geometry in
                   VStack(alignment: .leading) {
                        ZStack(alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
                           Image(self.user.imageName)
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                               .clipped()
                           
                           if self.swipeStatus == .like {
                               Text("LIKE").bold()
                                   .font(.headline)
                                   .padding()
                                   .cornerRadius(10)
                                   .foregroundColor(Color.green)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 10)
                                           .stroke(Color.green, lineWidth: 4.0)
                               ).padding(24)
                                   .rotationEffect(Angle.degrees(-45))
                           } else if self.swipeStatus == .nopes {
                               Text("NOPE")
                                .font(.headline).bold()
                                   .padding()
                                   .cornerRadius(10)
                                   .foregroundColor(Color.red)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: 4.0)
                               ).padding(.top, 45)
                                   .rotationEffect(Angle.degrees(45))
                           }
                       }
                       
                       HStack {
                           VStack(alignment: .leading, spacing: 6) {
                               Text("\(self.user.firstName) \(self.user.lastName), \(self.user.age)")
                                   .font(.title)
                                   .bold()
                            Text(self.user.occupation)
                                   .font(.subheadline)
                                   .bold()
                               Text("\(self.user.mutualFriends) Miles away")
                                   .font(.subheadline)
                                   .foregroundColor(.gray)
                           }
                           Spacer()
                           
                           Image(systemName: "info.circle")
                               .foregroundColor(.gray)
                       }
                       .padding(.horizontal)
                   }
                   .padding(.bottom)
                   .background(Color.white)
                   .cornerRadius(10)
                   .shadow(radius: 5)
                   .animation(.interactiveSpring())
                   .offset(x: self.translation.width, y: 0)
                   .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
                   .gesture(
                       DragGesture()
                           .onChanged { value in
                               self.translation = value.translation
                               
                               if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                                   self.swipeStatus = .like
                               } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                                   self.swipeStatus = .nopes
                               } else {
                                   self.swipeStatus = .none
                               }
                               
                       }.onEnded { value in
                           //snap distance > 0.5 half the width of the screen
                               if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                                   self.onRemove(self.user)
                               } else {
                                   self.translation = .zero
                               }
                           }
                   )
               }
           }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
       CardView(user: User(id: 1, firstName: "Satish", lastName: "Sharma", age: 27, mutualFriends: 0, imageName: "person1", occupation: "Traveler Around the World"),
             onRemove: { _ in
                // do nothing
        })
        .frame(height: 400)
        .padding()
        
    }
}
