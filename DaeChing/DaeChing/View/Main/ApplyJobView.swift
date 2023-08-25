//
//  ApplyJobView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

// MARK: 구직자일때 -> 지원서 작성

struct ApplyJobView: View {
    @State var userName: String = UserDefaults.standard.string(forKey: "userName") ?? "박보경"
    
    // MARK: 더미데이터
    @State var introduction: String = ""
    @State var portfolio: String = ""
    @State var resume: String = ""
    @State var awards: String = ""
    
    @Environment(\.presentationMode) var presentationMode // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("\(userName)님의 지원서")
                .font(.pretendard(.bold, size: 24))
                .foregroundColor(.systemBlack)
                .padding(.bottom, 16)
            
            // MARK: 자기소개, 포트폴리오, 이력서 및 경력 기술서, 수상경력
            Group {
                Text("자기소개")
                    .font(.pretendard(.bold, size: 15))
                    .foregroundColor(.systemBlack)
                TextEditor(text: $introduction)
                    .frame(maxWidth: .infinity)
                    .frame(height: 164)
                    .background(Color.clear)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.blue)
                    })
                
                Text("포트폴리오")
                    .font(.pretendard(.bold, size: 15))
                    .foregroundColor(.systemBlack)
                TextEditor(text: $portfolio)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.clear)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.blue)
                    })
                
                Text("이력서 및 경력 기술서")
                    .font(.pretendard(.bold, size: 15))
                    .foregroundColor(.systemBlack)
                TextEditor(text: $resume)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.clear)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.blue)
                    })
                
                Text("수상경력")
                    .font(.pretendard(.bold, size: 15))
                    .foregroundColor(.systemBlack)
                TextEditor(text: $awards)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.clear)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.blue)
                    })
            } // Group
            
            Spacer()
            
            Button {
                // MARK: 나의 지원서를 백엔드에 보내기
                sendPostApplyJob("url", introduction: introduction, portfolio: portfolio, resume: resume, awards: awards) {
                    responseObject, error in guard let _ = responseObject, error == nil else {
                        print(error ?? "Unknown error")
                        return
                    }
                }
                presentationMode.wrappedValue.dismiss() // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
            } label: {
                Text("지원하기")
                    .font(.pretendard(.bold, size: 16))
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainPrimary500.cornerRadius(12))
            }
        } // VStack
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 15)
        .navigationTitle("지원서 작성")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ApplyJobView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ApplyJobView()
        }
    }
}
