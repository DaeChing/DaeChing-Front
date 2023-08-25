//
//  ResumeModel.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

// Resumes
struct ResumeModel: Codable {
    let introduction: String // 자기소개
    let portfolio: String // 포트폴리오
    let resume: String // 이력서 및 경력 기술서
    let awards: String // 수상 경력
}
