//
//  Test.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/26.
//

import SwiftUI

struct Test: View {
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottom){
                Image("t1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                NavigationLink {
                    Image("t2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } label: {
                    Text(".")
                        .padding(50)
                }
                
                
            }
            
        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Test()
        }
    }
}
