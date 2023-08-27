//
//  SearchView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//
//
import SwiftUI


struct SearchView: View {
    @State var searchedText : String = ""
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Serch", text: $searchedText)
                
            }.padding ()
                .background(
                RoundedRectangle (cornerRadius: 12.5)
                    .fill(.gray.opacity (0.25))
                )
               // .frame (height: 50)
                .padding (.horizontal)
            //pepole to Follow
            ScrollView{
                //HS
                ForEach(0..<10,id: \.self){ _ in
                    PeopleToFollowComonentView()
                    Divider()
                }
             
                
            }//SCR
            .padding(.top)
            
            
        }//VS
    }//body
}//VIEW
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
