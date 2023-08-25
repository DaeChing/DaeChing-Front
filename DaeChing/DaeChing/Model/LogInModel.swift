//
//  UserModel.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI


// 로그인 - /login request
struct LogInModel: Codable {
    let userId: Int
    let name: String
    let role: String
    let loginId: String
    let password: String
}


