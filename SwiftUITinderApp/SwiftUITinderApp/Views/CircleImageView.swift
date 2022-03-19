//
//  CircleImageView.swift
//  SwiftUITinderApp
//
//  Created by Satish Sharma on 31/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import SwiftUI

//CircleImageView
struct CircleImageView: View {
   
    var body: some View {
            Image("person1")
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
