//
//  SignUpView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

struct SignUpView: View {
    @State var userName: String = ""
    @State var loginId: String = ""
    @State var password: String = ""
    @State var role: String = "구인자" //구인자, 구직자
    
    @State var userPasswordCheck: String = ""
    @State var isClicked: Bool = false
    
    var statusList = ["구인자", "구직자"]
    
    @Environment(\.presentationMode) var presentationMode // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
    
    var body: some View {
        VStack (spacing: 0){
            Spacer()
            Text("회원가입")
                .font(.pretendard(.bold, size: 28))
                .foregroundColor(.mainPrimary500)
                .padding(.bottom, 30)
            
            VStack (alignment: .leading, spacing: 16){
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 사용자 이름
                    Text("이름")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
                    TextField("", text: $userName)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(Color.clear)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(.blue)
                        })
                }
                
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 아이디
                    Text("ID")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
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
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 비밀번호
                    Text("Password")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
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
                
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 비밀번호 확인
                    Text("Password Check")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
                    TextField("", text: $userPasswordCheck)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(Color.clear)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(.blue)
                        })
                }
                
                HStack(spacing: 0){
                    Text("상태")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
                    
                    Picker("상태", selection: $role) {
                        ForEach(statusList, id: \.self) {
                            Text($0)
                        }
                    }.tint(Color.textLight300)
                }
                
            } // TextField VStack
            .padding(.bottom, 48)
            
            if isClicked && password != userPasswordCheck{
                Text("비밀번호가 일치하지 않습니다! 다시 확인해보세요")
            }
            
            
            Spacer()
            
            Button {
                isClicked = true
                // 회원가입 로직
                sendPostRequestSignUp("\(urlString)signup", userName: userName, loginId: loginId, password: password, role: role) { responseObject, error in guard let _ = responseObject, error == nil else {
                    print(error ?? "Unknown error")
                    return
                }
                }
                // 회원가입이 되었을때, 앱에 사용자의 ID, PW를 저장
                UserDefaults.standard.set(self.loginId, forKey: "loginId")
                UserDefaults.standard.set(self.password, forKey: "password")
                // 유저의 상태를 Userdefault에 저장해준다 "구인자" or "구직자"
                UserDefaults.standard.set(role, forKey: "role")
            } label: {
                Text("회원가입")
                    .font(.pretendard(.bold, size: 16))
                    .foregroundColor(.white)
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainPrimary500.cornerRadius(12))
            }
            .disabled(password != userPasswordCheck)
            .padding(.bottom, 23)

            HStack {
                Text("이미 회원이신가요?")
                    .font(.pretendard(.medium, size: 12))
                    .foregroundColor(Color.textLight300)
                
                Button {
                    // action
                    presentationMode.wrappedValue.dismiss() // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
                } label: {
                    Text("로그인")
                        .font(.pretendard(.medium, size: 12))
                        .foregroundColor(Color.mainPrimary500)
                }
            }
            .padding(.bottom, 20)
            
        } // VStack
        .padding(.horizontal, 19)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
