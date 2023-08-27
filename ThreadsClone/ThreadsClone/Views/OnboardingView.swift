//
//  OnboardingView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import SwiftUI
enum CurrentPresentView{
    case authentication
    case mainView
}
struct OnboardingView: View {
    @State var presentView: CurrentPresentView = .authentication
    @EnvironmentObject var auth: AuthViewModel
    @EnvironmentObject var userData : UserDataViewModel
    var body: some View {
    
        switch presentView{
            
        case .authentication:
            VStack{
                Image("1")
                    .resizable()
                    .scaledToFit()
                Spacer()

                Button(action: {

                    if auth.signIn(userData.users.randomElement()!.id){
                        presentView = .mainView
                    }
                    else {
                        presentView = .authentication
                    }

                }, label:  {
                    Text("Log in") .frame(width: 300, height: 50)
                    //                .padding()
                                        .background(.gray.opacity(0.7))
                                        .cornerRadius(12)
                                        .padding()
                                        .foregroundColor(.white)
                    
                })
               
            }.onAppear(){
                if auth.currentUserId.isEmpty == false{
                    presentView = .mainView
                }
            }
            
        case .mainView:
            MainView()
        }

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
