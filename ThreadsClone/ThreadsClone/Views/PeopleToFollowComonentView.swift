//
//  PeopleToFollowComonentView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 11/02/1445 AH.
//

import Foundation
import SwiftUI

struct PeopleToFollowComonentView: View {
    var body: some View {
        HStack(alignment:.top){
            
//    AsyncImage(url:URL(string:
//            "https://source.unsplash.com/100×100/?person" ))
//            { result in
//                if let image = result.image {image
//                    .resizable ()
//                    .scaledToFill()
//                }else{
//                    ProgressView()
//                }
//            }Abdulah
            AsyncImage(url: URL(string:"https://source.unsplash.com/100x100/?[user]"))
            //                        resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(4)
 
            
            .frame (width: 50, height: 50)
            .cornerRadius (25)
            Spacer()
            Spacer()


            VStack(alignment:.leading) {
            Text ("Username" )
                .fontWeight (.medium)
            Text ("First,last names")
                    .foregroundColor(.gray)
            Text ("21 followers")
            }//VS
            .frame (maxWidth:.infinity,alignment:.leading)
            Button(
                action: {
                
                },label : {
                Text("Follow")
                        .padding (.horizontal, 16)
                        .padding (.vertical, 8)
                        //.scenePadding ()
                    .background (
                    RoundedRectangle (cornerRadius: 12.5)
                    .stroke(.gray.opacity (0.25))
                    )//Roun
                }).buttonStyle(.plain)
        }//HS
        .padding (.horizontal)
    }
}
//
struct PeopleToFollowComonentView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleToFollowComonentView()
    }
}
