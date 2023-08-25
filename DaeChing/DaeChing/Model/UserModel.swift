//
//  UserModel.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

// MARK: 업로드할 모델(형태)
// 로그인
struct UserModel: Codable {
    let userName: String
    let userID: String
    let password: String
}

// 회원가입
struct SignInModel: Codable {
    let userName: String
    let userID: String
    let password: String
    let status: String
}
