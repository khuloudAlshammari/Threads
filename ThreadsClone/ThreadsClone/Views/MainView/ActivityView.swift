//
//  ActivityView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import SwiftUI
//
struct ActivityView: View {
    enum Category: String, CaseIterable{
        case all
        case replies
        case mentions
        case verified



        var title :String {

            switch self{

            case .all:
                return "All"
            case .replies:
                return "Replies"
            case .mentions:
                return "Mentions"
            case .verified:
                return "Verified"
            }
        }


    }

    @State var currentCategories: Category  = .all
    var body: some View {
        VStack{
            HStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(Category.allCases, id: \.self){ category in
                            Button(action: {
                                currentCategories = category
                            }, label: {
                                if currentCategories == category{
                                    Text(category.title)
                                        .frame(width: 88)
                                        .padding(.horizontal , 16)
                                        .padding(.vertical , 8)
                                        .foregroundColor(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12.5)
                                                .fill(.black)
                                        )

                                }
                                   else {
                                       Text(category.title)
                                           .frame(width: 88)
                                           .padding(.horizontal, 16)
                                           .padding(.vertical , 8)
                                           .background(
                                               RoundedRectangle(cornerRadius: 12.5)
                                                   .stroke(.gray.opacity(0.25))
                                           )
                                   }
                            }).buttonStyle(.plain)
                        }

                    }

                }

            }
         Spacer()
            ScrollView{
                ForEach(0...10, id:\.self){ _ in
                    HStack(alignment: .top){
                        AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person")
                        ) {result in
                            if let image = result.image {
                                image.resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())


                            } else {

                                ProgressView()
                            }

                        } .frame(width: 40, height: 40)
                        VStack(alignment: .leading){
                            Text("Username")
                            Text("Flawless").foregroundColor(.gray)
                            Text("5 Followers").foregroundColor(.gray)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        Button(action: {

                        }, label:{
                            Text("Follow")
                                .padding(.horizontal, 19)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 12.5).stroke(.gray.opacity(0.25))
                                )
                        }).buttonStyle(.plain)

                    }.padding(.horizontal)
                    Divider()
                }
            }}
    }
}
struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}


