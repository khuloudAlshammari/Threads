//
//  PostScreenView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import Foundation
import SwiftUI


struct PostScreenView: View {
    @State var posModelt: Post
    @State var userModel: UserModel
    @EnvironmentObject var userData: UserDataViewModel

    var body: some View {

            ScrollView(showsIndicators: false){
                PostCardCompenetView(post: posModelt, userModel: userModel )
                Divider()
                ForEach(posModelt.replay, id: \.self){ postID in
                    if let post = userData.fetchPostById(postID) {
                        if let user = userData.fetchUserById(post.createdBy){
                            PostCardCompenetView(post: post, userModel: user )
                            
                        }
                        
                    }
                    
                }
            }

    }
}
//struct PostScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostScreenView()
//    }
//}
