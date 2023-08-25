//
//  SignUpModel.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import Foundation

// MARK: 업로드할 모델(형태)
// 회원가입 - /signup
struct SignUpModel: Codable {
    let userName: String
    let loginId: String
    let password: String
    let role: String
}
