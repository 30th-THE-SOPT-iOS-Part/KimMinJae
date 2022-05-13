//
//  UserService.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/11.
//

import Foundation
import Alamofire

class UserService {
    static let shared = UserService()
    
    private init() {}
    
    // 회원가입 API
    func signUp(emailName: String, password: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.signUpURL                                     // URL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
        let body: Parameters = [
            "email": emailName,
            "name": emailName,
            "password": password
        ]
        
        
        
        // 요청서
        // Request 생성
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
                case .success:
                    // 성공 시에는 상태코드(Status Code)와 값(Value)이 넘어오겠죠?
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let value = response.value else { return }

                    // 해당 응답을 가지고 case 분기처리를 합니다. (200, 400, 500인지 - 200: 성공을 해서 데이터를 잘 받았는지 확인합니다.)
                let networkResult = self.judgeStatus(by: statusCode, value, SignUpResoponse.self)
                    completion(networkResult)

                // 실패 시에는 바로 networkFail(통신 실패)라는 신호를 알립니다.
                case .failure:
                    completion(.networkFail)
            }
        }
    }
    
    
    // 로그인 API
    func login(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        
        let url = APIConstants.loginURL                                     // URL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
        let body: Parameters = [                                            // HTTP body
            "name": name,
            "email": email,
            "password": password
        ]

        // 요청서
        // Request 생성
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)

        // 서버 통신 시작 - Request 시작
        dataRequest.responseData { response in
            // 요청(Request)를 하고 넘겨받은 응답의 결과를 가지고 성공 또는 실패 분기 처리를 합니다.
            switch response.result {
            case .success:
                // 성공 시에는 상태코드(Status Code)와 값(Value)이 넘어오겠죠?
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                
                // 해당 응답을 가지고 case 분기처리를 합니다. (200, 400, 500인지 - 200: 성공을 해서 데이터를 잘 받았는지 확인합니다.)
                let networkResult = self.judgeStatus(by: statusCode, value, LoginResponse.self)
                completion(networkResult)

            // 실패 시에는 바로 networkFail(통신 실패)라는 신호를 알립니다.
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    
    
    // 상태 코드와 값(value, data, response)를 가지고 통신의 결과를 핸들링하는 함수입니다.
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ response: T.Type) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(response.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출합니다.
        case 200: return .success(decodedData as Any)
        case 201: return .success(decodedData as Any)
        case 400..<500: return .requestErr(decodedData as Any)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    // 성공 시 넘겨받은 데이터를 decode하는 함수입니다.
    // 이 때 우리가 codable을 채택해서 만들어 놓은 구조체 형식의 데이터 모델을 사용합니다.
//    private func decodeVaildData<T: Codable>(data: Data,_ object: T.Type) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(object.self, from: data)
//        else { return .pathErr }
//
//        return .success(decodedData as Any)
//    }
    
    
}
