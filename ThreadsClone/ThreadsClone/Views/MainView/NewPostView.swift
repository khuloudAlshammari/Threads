//
//  NewPostView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import SwiftUI



struct NewPostView: View {
    @State var postContent: String = ""
    var body: some View {
        VStack{
            //heder
            ZStack{
                HStack{
                    
                    //Text("New threads")
                    Button(
                        action: {
                            
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(.gray)
                        })
                    .
                    buttonStyle(.plain)
                    Spacer()
                    Text("New threads")
                    Spacer()
                }//HS
                .padding(.leading,8)
            }//ZStack
            Divider()
            //post info
            HStack(alignment: .top){
                VStack{
                    
                    AsyncImage(url: URL(string:"https://source.unsplash.com/60x60/?[user]"))
                    //                        resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                       
                    Rectangle ()
                        .fill (.gray)
                    . frame (width: 2)
                    
                }//VS
                VStack(alignment:.leading){
                    Text("UserName")
                    TextEditor(text: $postContent)
                        .frame (maxHeight: 56)
                        //.border(.black)
                    Button(
                        action: {
                            
                        },
                        label: {
                            Image (systemName: "paperclip")
                                .foregroundColor(.gray)
                        }
                    )//button
                    .buttonStyle(.plain)
                    
                }//HS
                
                //.frame (maxWidth: .infinity)
                
                
            }//VS
            .frame (maxHeight: 200)
            .padding()
            //.border (.black)
            Spacer()
            HStack {
                Button(
                    action: {
                        
                    }, label: {
                        Text ("Anyone can reply")
                            .foregroundColor (.gray)
                        
                        
                        
                        
                    })
                .buttonStyle(.plain)
                Spacer()
                Button(
                    action: {
                        
                    }, label: {
                        Text ("Post")
                          
                            .foregroundColor (.blue)
                        
                        
                        
                        
                    })
               
                
            }.padding()
        }
    }
}
    
    struct NewPostView_Previews: PreviewProvider {
        static var previews: some View {
            NewPostView()
        }
    }
