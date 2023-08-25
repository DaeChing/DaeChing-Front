//
//  InfoApplicantsView.swift
//  DaeChing
//
//  Created by 신서연 on 2023/08/25.
//
import SwiftUI

struct InfoApplicantsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("기본 정보")
                        .font(.custom("Pretendard", size: 20).weight(.bold))
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 70, height: 70)
                                .foregroundColor(.systemGray2)
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 31, height: 24)
                        }
                        VStack(alignment: .leading) {
                            Text ("홍지표")
                                .font(.custom("Pretendard", size: 16).weight(.bold))
                                .padding(.bottom, 10)
                            Text ("남자. 1999")
                                .font(.custom("Pretendard", size: 12).weight(.semibold))
                        }
                        .padding(.leading, 20)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }

                    iconText(imageName: "envelope", labelText: "이메일")
                    iconText(imageName: "phone", labelText: "연락처")
                    iconText(imageName: "location", labelText: "주소")

                }.padding(.horizontal, 20)
                Divider()
                VStack(alignment: .leading) {
                    Text("지원 포지션 목록")
                        .font(.custom("Pretendard", size: 20).weight(.bold))
                        .padding(.bottom, 10)

                    HStack(spacing: 0){
                        positonList(recNum: "10", recWidth: 100, recColor: .blue)
                        positonList(recNum: "10", recWidth: 100, recColor: .green)
                        positonList(recNum: "8", recWidth: 68, recColor: .orange)
                        positonList(recNum: "6", recWidth: 40, recColor: .purple)
                        positonList(recNum: "1", recWidth: 20, recColor: .cyan)
                    }

                    HStack {
                        positionName(circleColor: .blue, positionText: "iOS")
                        positionName(circleColor: .green, positionText: "Android")
                        positionName(circleColor: .orange, positionText: "웹 프론트앤드")
                        positionName(circleColor: .purple, positionText: "웹 백앤드")
                        positionName(circleColor: .cyan, positionText: "기타")
                    }
                } .padding(20)
                Divider()

                VStack(alignment: .leading) {
                    Text("지원 현황")
                        .font(.custom("Pretendard", size: 20).weight(.bold))
                    HStack(spacing:0){

                        stateBar(stateNum: "10", stateText: "서류 전형")
                        stateBar(stateNum: "15", stateText: "코딩 테스트")
                        stateBar(stateNum: "5", stateText: "1차 면접")
                        stateBar(stateNum: "1", stateText: "2차 면접")
                        VStack(alignment: .leading){
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.textColorPrimary)
                                    .frame(width: 40, height: 40)

                                Text("0")
                                    .font(.custom("Pretendard", size: 16).weight(.semibold))
                                    .foregroundColor(.white)
                            }
                            Text("최종 합격")
                                .font(.custom("Pretendard", size: 10).weight(.semibold))
                        }
                    }


                }.padding(20)
            Spacer()

            }
            .navigationBarTitle("지원자 정보", displayMode: .inline)
        }
    }
}

struct stateBar: View {
    var stateNum = ""
    var stateText = ""
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 0) {
                ZStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.textColorPrimary)
                            .frame(width: 40, height: 40)
                    }
                    Text(stateNum)
                        .font(.custom("Pretendard", size: 16).weight(.semibold))
                        .foregroundColor(.white)
                }
                Rectangle()
                    .frame(width: 35, height: 4)
                    .foregroundColor(.textColorPrimary)
            }

            Text(stateText)
                .font(.custom("Pretendard", size: 10).weight(.semibold))
        }
        }
}

struct iconText: View {
    var imageName: String
    var labelText: String
    var body: some View {
        VStack (alignment: .leading){
            HStack(spacing: 20) {
                Image(systemName: imageName)
                Text(labelText)
                    .font(.custom("Pretendard", size: 16).weight(.medium))
                    .foregroundColor(.gray)
                Spacer()
            }
        }.padding(.vertical, 10)
    }
}

struct positionName: View {
    var circleColor: Color
    var positionText = ""
    var body: some View {
        HStack {
            Circle()
                .frame(width: 6)
                .foregroundColor(circleColor)
            Text(positionText)
                .font(.custom("Pretendard", size: 12).weight(.medium))
        }
    }
}

struct positonList: View {
    var recNum: String
    var recWidth: CGFloat
    var recColor: Color
    var body: some View {
        VStack {
            Text(recNum)
                .font(.custom("Pretendard", size: 10).weight(.medium))
            Rectangle()
                .frame(width: recWidth, height: 30)
                .foregroundColor(recColor)
            }
        }
    }



struct InfoApplicantsView_Previews: PreviewProvider {
    static var previews: some View {
        InfoApplicantsView()
    }
}
