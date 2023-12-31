//
//  LogInView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

struct LogInView: View {
    @State private var loginId: String = ""
    @State private var password: String = ""
    @State private var loginStatus: Bool = false
    
    @AppStorage("name") var name: String = UserDefaults.standard.string(forKey: "name") ?? "박보경"
    @AppStorage("role") var role: String = UserDefaults.standard.string(forKey: "role") ?? "구직자"

    var body: some View {
        NavigationView{
            if self.loginStatus == true {
                MainView()
            } else {
                VStack (spacing: 0){
                    Spacer()
                    
                    Text("로그인")
                        .font(.pretendard(.bold, size: 28))
                        .foregroundColor(Color.mainPrimary500)
                        .padding(.bottom, 73)
                    
                    VStack (spacing: 12){
                        HStack{
                            Text("ID")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.textLight300)
                                .frame(width: 25)
                            
                            TextField("", text: $loginId)
                                .frame(maxWidth: .infinity)
                                .frame(height: 36)
                                .background(Color.clear)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(.blue)
                                })
                            
                        }
                        HStack{
                            Text("PW")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.textLight300)
                                .frame(width: 25)
                            TextField("", text: $password)
                                .frame(maxWidth: .infinity)
                                .frame(height: 36)
                                .background(Color.clear)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(.blue)
                                })
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print(self.loginId + self.password)
                        
                        let rft = readItemKeyChain(userId: self.loginId)
                        if rft != nil {
                            UserDefaults.standard.set(rft, forKey: self.loginId)
                        } else {
//                            sendPostRequestLogIn("\(urlString)login", loginId: loginId, password: password) { responseObject, error in guard let _ = responseObject, error == nil
//                                else {
//                                    print(error ?? "Unknown error")
//                                    return
//                                }
//
//                                // 로그인이 되었을때, 앱에 사용자의 ID, PW를 저장
//                                self.loginStatus = true
//                                UserDefaults.standard.set(self.loginId, forKey: "userId")
//                                UserDefaults.standard.set(self.password, forKey: "password")
//
//                                print("loginStatus : \(self.loginStatus)")
//                            }
                            sendPostRequest("\(urlString)login", parameters: ["loginId": self.loginId, "password": self.password]){
                                responseObject, error in guard let _ = responseObject, error == nil else {
                                    print(error ?? "Unknown error")
                                    return
                                }
                                self.loginStatus = true
                                // 로그인이 되었을때, 앱에 사용자의 ID, PW를 저장
                                UserDefaults.standard.set(self.loginId, forKey: "userID")
                                UserDefaults.standard.set(self.password, forKey: "password")
                            
                                //                                            if let rftToken = responseObject {
                                //                                                let rft = rftToken["refresh"] as? String
                                //                                                self.userAccessToken = rftToken["access"] as? String ?? ""
                                //                                                setItemKeyChain(userId: self.userID, rft: rft!)
                                //                                                UserDefaults.standard.set(rft, forKey: self.userID)
                                //                                            }
                            }
                        }
                    }){
                        Text("로그인")
                            .frame(maxWidth: .infinity)
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.white)
                            .padding(.vertical, 13)
                            .background(Color.mainPrimary500)
                            .cornerRadius(10)
                        
                    }.padding(.bottom, 23)
                    
                    HStack {
                        Text("계정이 없으신가요?")
                            .font(.pretendard(.medium, size: 12))
                            .foregroundColor(Color.textLight300)
                        
                        NavigationLink(destination: SignUpView()){
                            Text("회원가입")
                                .font(.pretendard(.medium, size: 12))
                                .foregroundColor(Color.mainPrimary500)
                        } // NavigationLink
                    } .padding(.bottom, 20)
                }
                .padding(.horizontal, 19)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
    
    
    func readItemKeyChain(userId: String) -> String? {
        return UserDefaults.standard.string(forKey: userId)
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
