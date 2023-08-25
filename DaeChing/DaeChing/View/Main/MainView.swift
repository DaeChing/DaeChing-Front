//
//  MainView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 0
    @AppStorage("status") var status: String = UserDefaults.standard.string(forKey: "status") ?? "구인자"
    
    var body: some View {
        if status == "구인자" {
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
        } else { // 구직자일때의 뷰
            TabView(selection: $selectedTab) {
                ResearchJobView()
                    .tabItem({
                        Image(systemName: "bag")
                        Text("구직")
                    })
                    .tag(0)
                
                ChatView()
                    .tabItem({
                        Image(systemName: "list.bullet.clipboard")
                        Text("기록")
                    })
                    .tag(1)
                
                PeopleManageView()
                    .tabItem({
                        Image(systemName: "checkmark.seal")
                        Text("이력인증")
                    })
                    .tag(2)
                
                PeopleManageView()
                    .tabItem({
                        Image(systemName: "person")
                        Text("내 정보")
                    })
                    .tag(3)
            }
            .tint(Color.mainPrimary500)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
