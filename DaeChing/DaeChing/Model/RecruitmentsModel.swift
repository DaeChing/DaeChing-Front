//
//  RecruitmentsModel.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/25.
//

import SwiftUI

// RecuruitmentModel
struct RModel: Codable {
    let introduction: String // 기업소개
    let mainTasks: String // 주요 업무
    let qualificationRequirements: String // 자격 요건
    let preferredQualifications: String // 우대사항
    let recruitmentProcess: String // 채용 절차
    let welfare: String // 복리후생
}
