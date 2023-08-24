//
//  JSONParsingManager.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI

// 받아온 데이터를 우리가 쓰기 좋게 변환하는 과정 (분석) ======================================

// 현재의 형태
func parseJSON1(_ movieData: Data) -> [DailyBoxOfficeList]? {
    
    do {
        // 스위프트5
        // 자동으로 원하는 클래스/구조체 형태로 분석
        // JSONDecoder
        let decoder = JSONDecoder() // 데이터를 코드로 변형할 수 있는 JSONDecoder()
        
        // MovieData: 변형하고 싶은 형태, self: 붕어빵틀
        // decoder.decode는 error를 발생시킬 수 있는 메소드이기 때문에, try를 앞에 붙여줘야 한다, return타입이 있어서 변수에 담음
        // try를 사용하려면 반드시 do catch로 감싸줘야 한다
        let decodedData = try decoder.decode(MovieData.self, from: movieData) // 데이터를 받아서 내가 사용하고 싶은 형태로 변형
 
        return decodedData.boxOfficeResult.dailyBoxOfficeList // 변형한 것을 배열로 return
        
    } catch {
        
        return nil
    }
    
}


// 서버에서 주는 데이터의 형태 ====================================================

struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let openDt: String
}

/**
 원본 데이터
 "boxOfficeResult": {
 "boxOfficeType": "월별 박스오피스",
 "showRange": "20210201~20210201",
 "dailyBoxOfficeList": [
 {
 "rank": "1",
 "movieNm": "1",
 "audiCnt": "112",
 "audiAcc": "asad",
 "openDt": "asdasd",
 }
 ]
  }
 */

// 원본 데이터를 가지고  "https://app.quicktype.io/" 해당 링크에 들어가서 넣어주면, 알아서 코드를 변환해줌
