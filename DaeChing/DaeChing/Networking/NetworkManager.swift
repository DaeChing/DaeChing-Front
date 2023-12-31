//
//  NetworkManager.swift
//  DaeChing
//
//  Created by Bokyung on 2023/08/24.
//

import SwiftUI
import Alamofire

// MARK: GET 서버에서 데이터 읽어오기
// 사람들의 게시글 보기
func getMethod() {
    
    // URL구조체 만들기
    guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") else {
        print("Error: cannot create URL")
        return
    }
    
    // URL요청 생성, Requset에 "GET"을 할당해줄 수 있음
    var request = URLRequest(url: url)
    request.httpMethod = "GET" // GET이 아닌 경우(POST, PUT, DELETE)에는 일반적으로 URLRequest를 만들어줘야 한다
    
    
    // 요청을 가지고 작업세션시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
            
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))


    }.resume()     // 시작
}


// getMethod()


// MARK: POST 서버에 내가 원하는 new데이터 업로드하기
// 나의 게시글 올리기, 다른 사람의 게시글에 댓글 달기, 로그인
func postMethod() {
    
    guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/create") else {
        print("Error: cannot create URL")
        return
    }
    
    // 업로드할 모델(형태)
    struct UploadData: Codable {
        let name: String
        let salary: String
        let age: String
    }
    
    // 실제 업로드할 (데이터)인스턴스 생성
    let uploadDataModel = UploadData(name: "Jack", salary: "3540", age: "23")
    
    // 모델을 JSON data 형태로 변환
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 요청타입 JSON
    request.setValue("application/json", forHTTPHeaderField: "Accept") // 응답타입 JSON
    request.httpBody = jsonData // 내가 원하는 데이터를 httpBody에 넣어서 보내줌
    
    
    // 요청을 가지고 세션 작업시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        
    }.resume()   // 시작
}


// MARK: 로그인
func sendPostRequestLogIn(_ url: String, loginId: String, password: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
    guard let targetUrl = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }
    let userName = UserDefaults.standard.string(forKey: "userID") ?? "noName"
    // 실제 업로드할 (데이터)인스턴스 생성
    //let uploadDataModel = LogInModel(name: userName, userID: userID, password: password)
    let uploadDataModel = LogInModel(loginId: loginId, password: password)

    // 모델을 JSON data 형태로 변환
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }


    // URL요청 생성
    var request = URLRequest(url: targetUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 요청타입 JSON
    request.setValue("application/json", forHTTPHeaderField: "Accept") // 응답타입 JSON
    request.httpBody = jsonData // 내가 원하는 데이터를 httpBody에 넣어서 보내줌


    // 요청을 가지고 세션 작업시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }

        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        print("통신 성공~")

    }.resume()   // 시작
}


// MARK: POST - 로그인 시 필요
func sendPostRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
    let targetUrl = URL(string: url)
    let paramData = try? JSONSerialization.data(withJSONObject: parameters)
    
    var request = URLRequest(url: targetUrl!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = paramData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let data = data,                              // is there data
            let response = response as? HTTPURLResponse,  // is there HTTP response
            200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
            error == nil                                  // was there no error
        else {
            completion(nil, error)
            return
        }
        
        let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
        completion(responseObject, nil)
        
        print("로그인 성공!")
        print(responseObject ?? "값 없음")
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    task.resume()
}



// 회원가입
func sendPostRequestSignUp(_ url: String, userName: String, loginId: String, password: String, role: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
    guard let targetUrl = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }
    
    // 실제 업로드할 (데이터)인스턴스 생성
    let uploadDataModel = SignUpModel(userName: userName, loginId: loginId, password: password, role: role)

    
    // 모델을 JSON data 형태로 변환
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
   
    // URL요청 생성
    var request = URLRequest(url: targetUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 요청타입 JSON
    request.setValue("application/json", forHTTPHeaderField: "Accept") // 응답타입 JSON
    request.httpBody = jsonData // 내가 원하는 데이터를 httpBody에 넣어서 보내줌
    
    
    // 요청을 가지고 세션 작업시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        
    }.resume()   // 시작
}




// 공고 올리기
// recruitments - 기업이 채용 공고를 올립니다
func sendPostJobOffer(_ url: String, companyId: Int, introduction: String, work: String, qualificationRequirements: String, preferredQualifications: String, recruitmentProcess: String, welfare: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
    guard let targetUrl = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }
    
    // 실제 업로드할 (데이터)인스턴스 생성
    let uploadDataModel = CompanyModel(companyId: companyId, introduction: introduction, work: work, qualificationRequirements: qualificationRequirements, preferredQualifications: preferredQualifications, recruitmentProcess: recruitmentProcess, welfare: welfare)

    
    // 모델을 JSON data 형태로 변환
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
   
    // URL요청 생성
    var request = URLRequest(url: targetUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 요청타입 JSON
    request.setValue("application/json", forHTTPHeaderField: "Accept") // 응답타입 JSON
    request.httpBody = jsonData // 내가 원하는 데이터를 httpBody에 넣어서 보내줌
    
    
    // 요청을 가지고 세션 작업시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        
    }.resume()   // 시작
}


// postMethod()



// MARK: 지원서 작성
func sendPostApplyJob(_ url: String, userId: Int, introduction: String, portfolio: String, resume: String, awards: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
    guard let targetUrl = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }
    
    // 실제 업로드할 (데이터)인스턴스 생성
    let uploadDataModel = ResumeModel(userId: userId, introduction: introduction, portfolio: portfolio, resume: resume, awards: awards)
    
    // 모델을 JSON data 형태로 변환
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
   
    // URL요청 생성
    var request = URLRequest(url: targetUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 요청타입 JSON
    request.setValue("application/json", forHTTPHeaderField: "Accept") // 응답타입 JSON
    request.httpBody = jsonData // 내가 원하는 데이터를 httpBody에 넣어서 보내줌
    
    
    // 요청을 가지고 세션 작업시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        
    }.resume()   // 시작
}



// MARK: PUT 서버에 현존하는 데이터 업데이트하기
// 나의 포스트 수정, 다른 사람의 게시글 좋아요 누르기, 나의 정보 수정
func putMethod() {
    guard let url = URL(string: "https://reqres.in/api/users/2") else {
        print("Error: cannot create URL")
        return
    }
    
    // 업로드할 모델(형태)
    struct UploadData: Codable {
        let name: String
        let job: String
    }
    
    // 실제 업로드할 (데이터)인스턴스 생성
    let uploadDataModel = UploadData(name: "Nicole", job: "iOS Developer")
    
    // 모델을 JSON data 형태로 변환
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    
    // 요청을 가지고 작업세션시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("Error: error calling PUT")
            print(error!)
            return
        }
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        
    }.resume()
}

// putMethod()

// MARK: DELETE 서버에 현존하는 데이터 삭제
// 나의 포스트 삭제하기

func deleteMethod() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
        print("Error: cannot create URL")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    
    // 요청을 가지고 작업세션시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("Error: error calling DELETE")
            print(error!)
            return
        }
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        
    }.resume()
}

// deleteMethod()

