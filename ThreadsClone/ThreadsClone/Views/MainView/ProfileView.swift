//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    var nu = (String (repeating: "*", count: 20))
    var nu2 = (String (repeating: "*", count:28))
    var nu3 = (String (repeating: "*", count: 94))
    var nu4 = (String (repeating: "*", count: 12))
    
    @EnvironmentObject var userData: UserDataViewModel
    @EnvironmentObject var auth: AuthViewModel
    @State var currentUser:  UserModel?
    @State var currentUserPosts: Array<Post> = []

   
    var body: some View {
        VStack{
        
            if let currentUser = currentUser {

                HStack{
                    Spacer()
                    Button(
                        action: {
                            auth.signOut()
                    }, label: {
                      //  Text("Sign out")
                        Image(systemName: "door.left.hand.open")
                    })

                }
                HStack{
                    VStack{
                        Text(currentUser.fullName)
                        Text(currentUser.userName)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    AsyncImage(url:currentUser.image).frame(width: 75, height: 75).clipShape(Circle())
                }
                Text(currentUser.bio)
                Text("\(currentUser.followers.count) followers").frame(maxWidth: .infinity, alignment: .leading)
                HStack  {
                    Button(action: {

                    }, label: {
                        Text("Edit profile")

                            .frame (maxWidth: .infinity)
                            .padding (.horizontal, 16)
                            .padding(.vertical, 8)
                        
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(12.25)
                    })
                    Button(action: {

                    }, label: {
                        Text("Share profile")
                        
                            .frame (maxWidth: .infinity)
                        
                            .padding (.horizontal, 16)
                            .padding(.vertical, 8)
                            .background (
                                RoundedRectangle(cornerRadius:
                                                    12.25)
                                .stroke(.gray.opacity (0.25)))
                        
                    }).buttonStyle(.plain)

                }
            }
            else{
               
                HStack{
                    Spacer()
                    Button(action: {
                        auth.signOut()
                    }, label: {
                        Text("Sign out")
                    })

                }
                HStack{
                    VStack{
                        Text(nu)
                        Text(nu4)
                    }
                    Spacer()
                    AsyncImage(url:URL(string:  "https://source.unsplash.com/300x200/?person")).frame(width: 75, height: 75).clipShape(Circle())
                }
                Text(nu3)
                Text(nu2)
                HStack  {
                    Button(action: {

                    }, label: {
                        Text("Edit profile")
                             .frame (maxWidth: .infinity)
                            .padding (.horizontal, 16)
                            .padding(.vertical, 8)
                        
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(12.25)
                    })
                    Button(action: {

                    }, label: {
                        Text("Share profile")
                        .frame (maxWidth: .infinity)
                            .padding (.horizontal, 16)
                            .padding(.vertical, 8)
                        
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(12.25)
                    })

                }
            }
            ScrollView{
                ForEach(currentUserPosts){
                    postData in
                
                    if let user = userData.fetchUserById(postData.createdBy){
                        NavigationLink(destination: {
                            PostScreenView(posModelt: postData, userModel: user)
                        }, label: {
                            PostCardCompenetView(post: postData, userModel: user )
                        }).buttonStyle(.plain)

                    }else {
                    
                        Text("User not found")
                    }

                }
            }

        }.padding(.horizontal)

            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)){

                    if let uuid = UUID(uuidString: auth.currentUserId) {

                        if let user =   userData.fetchUserById(uuid){

                            self.currentUser = user
                        } else {
                            print("User not found") // Debug statement
                        }

                        self.currentUserPosts = userData.post.filter { post in
                            return post.createdBy == uuid
                        }
                    }
                }
            }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(UserDataViewModel()).environmentObject(AuthViewModel())
    }
}


