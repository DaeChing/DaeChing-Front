//
//  MyPageView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

// MARK: 신서연의 View❤️
struct MyPageView: View {
    let imageName = [["person", "alarm", "email"],["resume", "handShake", "save"], ["pencil", "follow", "q&a"] ]
    
    let labelText = [["계정", "알람 설정", "이메일 수신 설정"], ["내 이력서", "입사 제안", "저장한 채용 공고"], ["리뷰 작성 내역", "팔로잉 기업", "질문 내역"]]
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                Text("MY")
                    .font(.custom("Pretendard", size: 20).weight(.bold))
                    .padding(20)
                ForEach(imageName.indices, id: \.self) { index in
                    iconTextView(imageName: imageName[0][index]
                                 , labelText: labelText[0][index])
                }
                Text("채용")
                    .padding(20)
                    .font(.custom("Pretendard", size: 20).weight(.bold))
                ForEach(imageName.indices, id: \.self) { index in
                    iconTextView(imageName: imageName[1][index]
                                 , labelText: labelText[1][index])
                }
                Text("활동")
                    .font(.custom("Pretendard", size: 20).weight(.bold))
                    .padding(20)
                ForEach(imageName.indices, id: \.self) { index in
                    iconTextView(imageName: imageName[2][index]
                                 , labelText: labelText[2][index])
                }
                Spacer()
            }.navigationBarTitle("내 정보", displayMode: .inline)
                .navigationBarItems(trailing: Image(systemName: "bell").padding(.trailing,20))
        }
    }
}

struct iconTextView: View {
    var imageName: String
    var labelText: String
    var body: some View {
        VStack{
            HStack(spacing: 20) {
                Image(imageName)
                Text(labelText)
                    .font(.custom("Pretendard", size: 20).weight(.bold))
                Spacer()
            }.padding(.leading)
            
        }
    }
        
    }



struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
