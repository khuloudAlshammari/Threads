//
//  UserData.swift
//  ThreadsClone
//
// Created by khuloud alshammari on 05/02/1445 AH.
//

import Foundation
class UserDataViewModel: ObservableObject {
    @Published var post: Array <Post> = []
    @Published var users: Array <UserModel> = []
    
    init(){
        //prepare data
        let  maxNumberOfUsers = 100
        for _ in 0..<100{
            let  firstandlastname = makeRandomFullName()
            let fullname =  "\(firstandlastname[0]) \(firstandlastname[1])"
            let username = "\(firstandlastname[0]).\(firstandlastname[1])".lowercased()
            let user = UserModel(userName: username,
                                 fullName: fullname,
                                 bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                 image: URL(string: "https://source.unsplash.com/100x100/?person")!,
                                 followers: [],
                                 following: [],
                                 posts: [])
            users.append(user)
 
      
        }
        let maxNumberOfPosts = maxNumberOfUsers * 5
        for _ in 0..<maxNumberOfPosts {
            let userId = users.randomElement()!.id
            let postData =
            Post(createdBy: userId, content: makeRandomContent(),
                 createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes:[])
            
            post.append(postData)


            let index = users.firstIndex(where: { user in
                user.id == userId
            })
            if let index = index {
                users[index].posts.append(postData.id)
            }
        }
        // prepare following
        for _ in 0..<(maxNumberOfUsers * 2) {
            let user1 = users.indices.randomElement()!
            let user2 = users.indices.randomElement()!
            if user1 != user2 {
                users [user1].following.append(users[user2].id)
                users[user2].followers.append(users[user1].id)
            }
        }
        

        // prepare likes
        for _ in 0..<(maxNumberOfPosts * 5) {
            let userIndex = users.indices.randomElement()!
            let postIndex = post.indices.randomElement()!
            let isNotLiking = post[postIndex].likes
                .contains (users[userIndex].id) == false
            if isNotLiking {
                post[postIndex].likes.append(users[userIndex].id)
            }
        }
    }
    
   
    
    
    
    func fetchPost() {
        let numberOfPost = Int.random(in: 3...10)

        var _post:  Array <Post> = []

        for _ in 0...numberOfPost {
            let arraypost = Post(createdBy: UUID() , content: makeRandomContent(),
                                 createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes:[])
            
            
            _post.append(arraypost)
            
        }
        post = _post

    }
    //userName: makeRandomFullName(), userImage: URL(string: "https://source.unsplash.com/600x500/?person")!
    func  makeRandomFullName() -> Array<String>{
      
        let username = """
        Tamara Larsen
        Owen Blankenship
        Allison Fernandez
        Aliyah Hahn
        Kayleigh Phillips
        Eva Higgins
        Mauricio Nicholson
        Yandel Nelson
        Darryl Chavez
        Tianna Chaney
        Adonis Hobbs
        Nayeli Patterson
        """
            .components(separatedBy: "\n")
        //random line
        
        return username.randomElement()!.components(separatedBy: " ")
        //        return ""
    }
    func makeRandomContent() -> Optional<String>{
        let shouldContainContent = Bool.random()
        if shouldContainContent{
            return "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
            
        }
        else{
            return ""
        }
    }
    func makeRandomAttachments() -> Array<URL> {
        let numberOfImage = Int.random(in: 0...5)
        var arrayOfURL =  Array<URL>()
        for _ in 0...numberOfImage{
            arrayOfURL.append( URL(string: "https://source.unsplash.com/60x60/?person")!)
        }
        return arrayOfURL
    }
    
    func fetchUserById(_ userID: UserModel.ID) -> Optional<UserModel>{
        let index = users.firstIndex(where: { user in
            user.id == userID
        } )
        if let index = index {
            return users[index]
        } else {
            return nil
            
        }
    }
    
    
    
    func fetchPostById(_ postId: Post.ID) -> Optional<Post> {
        let index = post.firstIndex(where: { post in
            post.id == postId})
        if let index = index {
            return post[index]
        }
        return nil
        
        
    }
    
   
    
}

