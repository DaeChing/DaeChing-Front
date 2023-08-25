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
    @State var selfIntroduction: String = ""
    

    var body: some View {
        
        VStack(alignment: .leading) {
            Text(userName)
                .font(.pretendard(.bold, size: 24))
                .foregroundColor(.systemBlack)
                .padding(.bottom, 16)
            
            Text("자기소개")
                .font(.pretendard(.bold, size: 15))
                .foregroundColor(.systemBlack)
            TextEditor(text: $selfIntroduction)
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
            
            Text("이력서 및 경력 기술서")
                .font(.pretendard(.bold, size: 15))
                .foregroundColor(.systemBlack)
            
            Text("수상경력")
                .font(.pretendard(.bold, size: 15))
                .foregroundColor(.systemBlack)
                
        }
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
