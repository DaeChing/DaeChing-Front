//
//  JobDetailView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

// MARK: 구직자일때 -> 기업 정보뷰

struct JobDetailView: View {
    
    // MARK: 더미 데이터
    @State var companyIntroduction: String = "건강한 개발 생활을 위한 거북목 자세 알림 어플리케이션 개발 회사, (주)토피아 다양한 방면에서 고객의 문제를 해결하기 위해 힘을 쓰고 있습니다. 현재는 개발자들을 위한 거북목 자세를 교정해주는 알림 어플리케이션을 개발 및 유지보수 중입니다. iOS생태계에 관심이 많으며, HIG 및 디자인 시스템을 적용시킨 앱을 개발 중에 있습니다. " // 기업소개
    @State var mainTasks: String = "(주)토피아의 iOS 앱의 신규 서비스 개발, 유지 보수 등 iOS앱 서비스에 관련된 모든 업무를 담당합니다." // 주요업무
    @State var qualificationRequirements: String = "iOS개발에 진심이신 분\n Swift에 대한 이해도가 높으신 분\n RXSwift에 대한 경험이 있으며 이해도가 높으신 분\n 적극적으로 코드 리뷰에 참여하고 긍정적으로 생각하시는 분\n MVVM, RIBs 등 디자인 패턴에 대해 경험해보신 분\n SwiftUI에 대한 경험이 있으신 분" // 자격요건
    @State var preferredQualifications: String = "우대 사항" // 우대사항
    @State var recruitmentProcess: String = "서류 전형 > 사전 채용 과제 > 1차 인터뷰 > 2차 인터뷰 > 최종 합격" // 채용절차
    @State var welfare: String = "모든 직원들에게 맥북 프로 지원" // 복리후생
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0){
                HStack (spacing: 0) {
                    VStack (alignment: .leading, spacing: 0){
                        Text("(주)토피아")
                            .font(.pretendard(.black, size: 24))
                            .foregroundColor(.systemBlack)
                        Text("iOS Developer | 대구 북구")
                            .font(.pretendard(.medium, size: 15))
                            .foregroundColor(.systemGray1)
                    }
                    
                    Spacer()
                    Button {
                        // action
                    } label: {
                        Image(systemName: "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .foregroundColor(.black)
                    }
                } // 상단 기업 정보 + 북마크
                
                Image("ImgJootpia")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 24)
                
                VStack (spacing: 25){
                    VStack (alignment: .leading, spacing: 11){
                        Text("기업소개")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                            .underline(color: .mainPrimary500)
                        Text(companyIntroduction)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundColor(.systemBlack)
                    } // 기업소개
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                    
                    VStack (alignment: .leading, spacing: 11){
                        Text("주요 업무")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                            .underline(color: .mainPrimary500)
                        Text(mainTasks)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundColor(.systemBlack)
                            
                    } // 주요 업무
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("자격 요건")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                            .underline(color: .mainPrimary500)
                        Text(qualificationRequirements)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundColor(.systemBlack)
                    } // 자격 요건
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("우대사항")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                            .underline(color: .mainPrimary500)
                        Text(preferredQualifications)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundColor(.systemBlack)
                    } // 우대사항
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("채용절차")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                            .underline(color: .mainPrimary500)
                        Text(recruitmentProcess)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundColor(.systemBlack)
                    } // 채용절차
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("복리후생")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                            .underline(color: .mainPrimary500)
                        Text(welfare)
                            .font(.pretendard(.medium, size: 16))
                            .foregroundColor(.systemBlack)
                    } // 복리후생
                    .frame(maxWidth: .infinity, alignment: .leading)
                } // Text
                .padding(.bottom, 25)
                
                
                NavigationLink {
                    // destination
                    ApplyJobView()
                } label: {
                    Text("지원서 작성")
                        .font(.pretendard(.bold, size: 16))
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.mainPrimary500.cornerRadius(12))
                } // NavigationLink
            } // VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 25)
        } // ScrollView
        .navigationTitle("기업 정보")
        .navigationBarTitleDisplayMode(.inline)
    }


}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobDetailView()
        }
    }
}
