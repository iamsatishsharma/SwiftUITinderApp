//
//  HomeView.swift
//  SwiftUITinderApp
//
//  Created by Satish Sharma on 30/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    
    @State var users : [User] = cardusers;

    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
           let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
           return geometry.size.width - offset
       }

       private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
           return  CGFloat(users.count - 1 - id) * 10
       }

       private var maxID: Int {
           return self.users.map { $0.id }.max() ?? 0
       }

    
    /**
     */
    var body: some View {
       
        VStack {
                    GeometryReader { geometry in
                        LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8509803922, green: 0.6549019608, blue: 0.7803921569, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.862745098, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                            .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .offset(x: -geometry.size.width / 4, y: -geometry.size.height / 2)
                        
                        VStack(spacing: 24) {
                            DateView()
                            
                            ZStack {
                                ForEach(self.users, id: \.self) { user in
                                    Group {
                                        // Range Operator
                                        if (self.maxID - 3)...self.maxID ~= user.id {
                                            CardView(user: user, onRemove: { removedUser in
                                                // Remove that user from our array
                                                self.users.removeAll { $0.id == removedUser.id }
                                            })
                                                .animation(.spring())
                                                .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                                .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                                        }
                                    }
                                }
                            }
                            
                            Spacer()
                            FavView()
                            Spacer()
                            
                        }
                    }
                }.padding()
            }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

/***/
struct DateView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Friday, 10th January")
                        .font(.title)
                        .bold()
                    Text("Today")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

/**
 FavView
 */
struct FavView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    //CircleImageView()
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .clipShape(Circle())
                    
//                    Text("Friday, 10th January")
//                        .font(.title)
//                        .bold()
                    Text("Today")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


