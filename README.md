# SwiftUITinderApp
TinderApp-iOS application in SwiftUI

# Follow and give a star :star:
Connect with me on [Linkedin](https://www.linkedin.com/in/satishsharma1/) as well to support this project. 

<h1>SwiftUITinderApp iOS application + SwiftUI </h1>

SwiftUI : SwiftUI is a new way to build user interfaces for apps on Apple platforms. It allows developers to define the UI using Swift code.

# Dashboard

<img src="https://github.com/sharmadevelopers/SwiftUITinderApp/blob/Development/SwiftUITinderApp.gif" width="300" height="600">

<img src="https://github.com/sharmadevelopers/SwiftUITinderApp/blob/Development/HomeScreen1.png" width="300" height="600">

<img src="https://github.com/sharmadevelopers/SwiftUITinderApp/blob/Development/HomeScreen3.png" width="300" height="600">

The code would look like this:

// MARK: Dashboard Screen

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
----------------------------------------------------

//User model
struct User: Hashable, CustomStringConvertible {
    
    var id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
}
------------------------------------------------------

# Thanks
[SwiftUI] (https://developer.apple.com/xcode/swiftui/)


# License

SwiftUITinderApp is available under the MIT license. See the LICENSE file for more info.

      
      
