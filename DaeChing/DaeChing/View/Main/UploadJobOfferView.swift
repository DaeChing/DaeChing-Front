//
//  UploadJobOfferView.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

// MARK: 구인자일때 -> 공고 올리기

struct UploadJobOfferView: View {
    @State var companyIntroduction: String = "" // 기업소개
    @State var mainTasks: String = "" // 주요업무
    @State var qualificationRequirements: String = "" // 자격요건
    @State var preferredQualifications: String = "" // 우대사항
    @State var recruitmentProcess: String = "" // 채용절차
    @State var welfare: String = "" // 복리후생
    
    @Environment(\.presentationMode) var presentationMode // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
    
    @State var isUpload: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0){
                Text("(주)토피아")
                    .font(.pretendard(.black, size: 24))
                    .foregroundColor(.systemBlack)
                Text("iOS Developer | 대구 북구")
                    .font(.pretendard(.medium, size: 15))
                    .foregroundColor(.systemGray1)
                
                Image("ImgJootpia")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 24)
                
                VStack (spacing: 25){
                    VStack (alignment: .leading,spacing: 11){
                        Text("기업소개")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                        TextEditor(text: $companyIntroduction)
                            .frame(maxWidth: .infinity)
                            .frame(height: 164)
                            .background(Color.clear)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(.blue)
                            })
                    } // 기업소개
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("주요 업무")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                        TextEditor(text: $mainTasks)
                            .frame(maxWidth: .infinity)
                            .frame(height: 164)
                            .background(Color.clear)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(.blue)
                            })
                    } // 주요 업무
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("자격 요건")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                        TextEditor(text: $qualificationRequirements)
                            .frame(maxWidth: .infinity)
                            .frame(height: 164)
                            .background(Color.clear)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(.blue)
                            })
                    } // 자격 요건
                    
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("우대사항")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                        TextEditor(text: $preferredQualifications)
                            .frame(maxWidth: .infinity)
                            .frame(height: 164)
                            .background(Color.clear)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(.blue)
                            })
                    } // 우대사항
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("채용절차")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                        TextEditor(text: $recruitmentProcess)
                            .frame(maxWidth: .infinity)
                            .frame(height: 164)
                            .background(Color.clear)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(.blue)
                            })
                    } // 채용절차
                    
                    VStack (alignment: .leading,spacing: 11){
                        Text("복리후생")
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.systemBlack)
                        TextEditor(text: $welfare)
                            .frame(maxWidth: .infinity)
                            .frame(height: 164)
                            .background(Color.clear)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(.blue)
                            })
                    } // 복리후생
                } // TextFields
                .padding(.bottom, 25)
                
                
                Button {
                    // MARK: 업로드 - 공고 올리기
                    sendPostJobOffer("url", companyIntroduction: companyIntroduction, mainTasks: mainTasks, qualificationRequirements: qualificationRequirements, preferredQualifications: preferredQualifications, recruitmentProcess: recruitmentProcess, welfare: welfare) { responseObject, error in guard let _ = responseObject, error == nil else {
                        print(error ?? "Unknown error")
                        return
                    }
                    }
                    presentationMode.wrappedValue.dismiss() // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
                    isUpload = true
                } label: {
                    Text("등록하기")
                        .font(.pretendard(.bold, size: 16))
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.mainPrimary500.cornerRadius(12))
                } // Button
                
            } // VStack
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 25)
        } // ScrollView
        .alert(isPresented: $isUpload) {
            Alert(title: Text("정상적으로 업로드 완료하였습니다!"), message: Text("열심히 작성하신 구인공고가 정상적으로 업로드되었습니다"), dismissButton: .default(Text("확인"), action: {
                presentationMode.wrappedValue.dismiss() // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
            })) // Alert
        } // alert
        .navigationTitle("공고 올리기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UploadJobOfferView_Previews: PreviewProvider {
    static var previews: some View {
        UploadJobOfferView()
    }
}
