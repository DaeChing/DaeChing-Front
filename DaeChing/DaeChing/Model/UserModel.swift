//
//  UserModel.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

// 업로드할 모델(형태) - 로그인
struct UserModel: Codable {
    let userID: String
    let password: String
}
