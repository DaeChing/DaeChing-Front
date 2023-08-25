//
//  MyStateView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

// MARK: 신서연의 View❤️
struct MyStateView: View {
    @State var selected = "전체"
    @Namespace var nameSpace
    var body: some View {
        NavigationView {
            VStack {
                headerArea
                    .padding(.vertical, 17)
                totalArea()
                Spacer()
            }
            .navigationBarTitle("입사지원 현황", displayMode: .inline)
        }
       
    }
    
}


// TODO: 색깔 바꿔여
private func totalArea() -> some View {
    VStack(alignment: .leading) {
        HStack {
            cuteBtn(btnColor: .blue, btnText: "지원완료", textColor: .white, btnnum: "1")
            Spacer()
            cuteBtn(btnColor: .gray.opacity(0.1), btnText: "전형 진행중", textColor: .gray, btnnum: "0")
            Spacer()
            cuteBtn(btnColor: .gray.opacity(0.1), btnText: "최종 발표", textColor: .gray, btnnum: "0" )
        }
        .padding(.horizontal,20)
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.black, lineWidth: 1)
            .foregroundColor(.clear)
            .frame(width: 86,height: 35)
            .overlay {
                HStack {
                    Text("지난 1개월")
                        .font(.system(size: 12))
                        .padding(.leading,7)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.system(size: 8))
                        .padding(.trailing,7)
                }
            }
            .padding(.leading,20)
            .padding(.vertical,17)
        
        listView()
        
    }
}

extension MyStateView {
    private var headerArea: some View {
        VStack {
            HStack {
                HStack {
                    Button {
                        withAnimation(.spring(response: 0.5,dampingFraction: 0.8)) {
                            selected = "전체"
                        }
                    } label: {
                        Text("전체")
                            .foregroundColor(.black)
                            .font(.custom("Pretendard", size: 16).weight(.bold))
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.blue)
                            .frame(width: 21,height: 16)
                            .overlay {
                                Text("1")
                                    .foregroundColor(.white)
                                
                            }
                    }
                }
                .overlay(alignment: .bottom) {
                    if selected == "전체" {
                        Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "activeStorke", in: nameSpace)
                    }
                       
                }
                HStack {
                    Button {
                        withAnimation(.spring(response: 0.5,dampingFraction: 0.8)) {
                            selected = "지원서 작성중"
                        }
                        
                    } label: {
                        Text("지원서 작성중")
                            .font(.custom("Pretendard", size: 16).weight(.bold))
                            .foregroundColor(.black)
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.gray)
                            .frame(width: 21,height: 16)
                            .overlay {
                                Text("0")
                                    .foregroundColor(.white)
                                
                            }
                    }
                }
                .overlay(alignment: .bottom) {
                    if selected == "지원서 작성중" {
                        Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "activeStorke", in: nameSpace)
                    }
                       
                }
                Spacer()
            }
            .padding(.leading,20)
        }
        
    }
}


private func cuteBtn(btnColor: Color, btnText: String, textColor: Color,btnnum: String) -> some View {
    Button {
        print("으악")
    } label: {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(btnColor)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .overlay {
                HStack{
                    Text(btnText)
                        .foregroundColor(textColor)
                        .font(.custom("Pretendard", size: 12).weight(.bold))
                        .padding(.leading,7)
                    Spacer()
                    Text(btnnum)
                        .foregroundColor(textColor)
                        .font(.custom("Pretendard", size: 12).weight(.bold))
                        .padding(.trailing,7)
                }
            }
    }
}
// MARK: 색상 및 폰트 변경하세요
private func listView() -> some View {
    VStack(alignment: .leading) {
        Divider()
        HStack {
            Text("23.8.20 ")
                .font(.custom("Pretendard", size: 12).weight(.semibold))
                .padding(.leading,20)
            Spacer()
            Text("(주) 토피아")
                .font(.custom("Pretendard", size: 16).weight(.bold))
            Spacer()
            Text("지원완료")
                .font(.custom("Pretendard", size: 16).weight(.bold))
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing,20)
            
        }
        .padding(.vertical, 20)
        Divider()
    }
}
struct MyStateView_Previews: PreviewProvider {
    static var previews: some View {
        MyStateView()
    }
}
