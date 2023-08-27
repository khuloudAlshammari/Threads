//
//  ActivityComponentView.swift
//  ThreadsClone
//
//  Created by khuloud alshammari on 05/02/1445 AH.
//

import Foundation

import SwiftUI

struct ActivityComponentView: View {
    var body: some View {
        VStack{
            HStack{
                ScrollView(.horizontal){
                    Button(action: {
                        
                    }, label: {
                        Text("ALL")
                    })
                }
                
            }
        }
    }
}


