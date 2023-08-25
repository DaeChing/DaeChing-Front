//
//  MainView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 0
    
    var body: some View {
        // 구인자일때의 뷰
        TabView(selection: $selectedTab) {
            ResearchJobView()
                .tabItem({
                    Image(systemName: "person")
                    Text("구인")
                })
                .tag(0)
            
            ChatView()
                .tabItem({
                    Image(systemName: "message")
                    Text("소통")
                })
                .tag(1)
            
            PeopleManageView()
                .tabItem({
                    Image(systemName: "list.clipboard")
                    Text("관리")
                })
                .tag(2)
        }
        .tint(Color.mainPrimary500)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
