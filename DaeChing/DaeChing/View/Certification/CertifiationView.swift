//
//  CertifiationView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

// MARK: 신서연의 View❤️
struct CertifiationView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("적성률")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                    
                    Text(" 60%")
                        .foregroundColor(.mainPrimary500)
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                    //                    Divider()
                    //                        .frame(height: 16)
                    Rectangle()
                        .frame(width: 0.5,height: 12)
                        .foregroundColor(.mainPrimary500)
                    Text("내 이력을 인증하고 지원해 보세요")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                }
                .padding(.leading, 12)
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundColor(.blue)
                    .padding(.bottom,12)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("경력")
                            .font(.custom("Pretendard", size: 20).weight(.bold))
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.mainPrimary500)
                    }
                    .padding(.bottom, 10)
                    Text("총 경력")
                        .font(.custom("Pretendard", size: 12).weight(.bold))
                    + Text(" 1년 1개월")
                        .font(.custom("Pretendard", size: 12).weight(.bold))
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.bottom,12)
                    
                    Text("PINEAPPLE")
                        .font(.custom("Pretendard", size: 16).weight(.bold))
                    HStack {
                        Text("iOS 개발자")
                            .font(.custom("Pretendard", size: 16).weight(.medium))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.vertical, 10)
                    Text("2022.03 - 2023. 04")
                    
                }
                .padding(.horizontal,12)
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.vertical,12)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("학력")
                            .font(.custom("Pretendard", size: 20).weight(.bold))
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.mainPrimary500)
                    }
                    Text("학교명")
                        .font(.custom("Pretendard", size: 16).weight(.bold))
                        .padding(.vertical, 8)
                    HStack {
                        Text("전공 및 학위")
                            .font(.custom("Pretendard", size: 16).weight(.medium))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.bottom, 8)
                    Text("년.월 - 년.월")
                        .font(.custom("Pretendard", size: 16).weight(.medium))
                    
                }
                .padding(.horizontal,12)
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.vertical,12)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("활동 및 수상")
                            .font(.custom("Pretendard", size: 20).weight(.bold))
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.mainPrimary500)
                    }
                    HStack {
                        Text("대외활동, 봉사활동, 수상내역 등")
                            .font(.custom("Pretendard", size: 16).weight(.bold))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.vertical, 8)
                    Text("년.월 - 년.월")
                        .font(.custom("Pretendard", size: 16).weight(.medium))
                    
                }
                .padding(.horizontal,14)
                .navigationBarTitle("내 이력 인증",displayMode: .inline)
                
                HStack {
                    Spacer()
                    BtnComponet(btnColor: Color.gray, btnName: "임시저장", textColor: .black, btnWidth: 162, btnHeight: 52, btnRadius: 12, action: {
                        print("눌렸다")})
                    
                    BtnComponet(btnColor: Color.mainPrimary500, btnName: "작성완료", textColor: .white, btnWidth: 162, btnHeight: 52, btnRadius: 12, action: {
                        print("또 눌렸다.")
                    })
                    Spacer()
                }
                
            }
            
        }
        
        
        
    }
}


struct CertifiationView_Previews: PreviewProvider {
    static var previews: some View {
        CertifiationView()
    }
}

struct BtnComponet: View {
    var btnColor: Color
    var btnName: String
    var textColor: Color
    var btnWidth: CGFloat
    var btnHeight: CGFloat
    var btnRadius: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: btnRadius)
                .frame(width: btnWidth,height: btnHeight)
                .foregroundColor(btnColor)
                .overlay {
                    Text(btnName)
                        .foregroundColor(textColor)
                        .font(.system(size: 16,weight: .bold))
                }
        }
        
    }
}
