//
//  CompanyModel.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

// MARK: GET - 기업 정보 상세 조회
// 기업의 상세한 정보를 조회 - /companies/{companyId}

// parameters: companyId: Int
struct CompanyModel: Codable {
    let companyId: Int
    let introduction: String
    let work: String
    let qualificationRequirements: String
    let preferredQualifications: String
    let recruitmentProcess: String
    let welfare: String
}

// ViewModel은 class로 선언해야 함
// MARK: ViewModel - model의 데이터 값을 변경할때 만드는 것
//class CompanyViewModel: ObservableObject {
//    @Published var companyViewModel: [CompanyModel] = []
//
//    init() {
//        getData()
//    }
//
//    func getData() {
//        let recOne = CompanyModel(title: "다채롭게 만개한\n어버이날 선물.", explain: "쉽게 선물 쇼핑하기", imageName: "ImgJootpia", titleColor: "ColorFontBlack", explainColor: "ColorFontBlack")
//        let recTwo = CompanyModel(title: "iPhone 14 Pro\n딥퍼플", explain: "몽환적인 색감, 색다른 경험.", imageName: "ImgJootpia", titleColor: "ColorFontWhite", explainColor: "ColorFontGray")
//        let recThree = CompanyModel(title: "MacBook Pro 14\n및 16", explain: "이거 문구를 발견하고, 톡방에 메세지를\n먼저 보내는 사람은 페페의 선물이!", imageName: "ImgJootpia", titleColor: "ColorFontWhite", explainColor: "ColorFontGray")
//
//        companyViewModel.append(recOne)
//        companyViewModel.append(recTwo)
//        companyViewModel.append(recThree)
//    }
//}
