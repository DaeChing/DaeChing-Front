//
//  ContentView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

// MARK: 백엔드 서버
let urlString: String = "http://13.125.91.239:8081/"

struct ContentView: View {
    @State var isLoading: Bool = true
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
    @AppStorage("name") var name: String = UserDefaults.standard.string(forKey: "name") ?? "박보경"
    @AppStorage("role") var role: String = UserDefaults.standard.string(forKey: "role") ?? "구직자"
    
    var body: some View {
        ZStack {
            //            if isLoggedIn { // 로그인이 된 상태라면
            //                NavigationView {
            //                    MainView()
            //                }
            //            } else { // 로그인이 되지 않은 상태라면
            //                VStack (spacing: 0){
            //                    LogInView()
            //                } .zIndex(0)
            //            }
            
            LogInView()
            NavigationView {
                MainView()
            }
//            Test()
            
            if isLoading { // Splash
                launchScreenView.transition(.opacity).zIndex(1)
            }
        } // ZStack
        .onAppear {
            //autoLogin()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                withAnimation { isLoading.toggle() }
            })
        } // onAppear
    }
    
    //    func autoLogin() { // 자동 로그인 기능
    //        if let loginId = UserDefaults.standard.string(forKey: "userId") {
    //            if let password = UserDefaults.standard.string(forKey: "password") {
    //                sendPostRequestLogIn("\(urlString)login",userId: 0, name: name, completion: ([String : Any]?, Error?) -> Void, role: role, loginId: loginId, password: password) { responseObject, error in guard let _ = responseObject, error == nil else {
    //                    print(error ?? "Unknown error")
    //                    return
    //                }
    //                }
    //            }
    //        }
    //    } // func autoLogin
}


extension ContentView {
    var launchScreenView: some View {
        ZStack (alignment: .center){
            Image("Splash").resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
