//
//  ImageService.swift
//  SOPT-week1-assignment
//
//  Created by 김민재 on 2022/05/13.
//

import Foundation
import Alamofire

class ImageService {
    
    static let shared = ImageService()
    
    private init() {}
    
    
    // 이미지 가져오기 open API
    func getImageList(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.imageURL                                    // URL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
        let QueryParams: Parameters = [
            "page": 1,
            "limit": 4
        ]
        
        // Request 생성
        let dataRequest = AF.request(url,
                                    method: .get,
                                    parameters: QueryParams,
                                     encoding: URLEncoding.queryString,
                                    headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let value = response.value else { return }

                    // 해당 응답을 가지고 case 분기처리를 합니다. (200, 400, 500인지 - 200: 성공을 해서 데이터를 잘 받았는지 확인합니다.)
                    let networkResult = self.judgeStatus(by: statusCode, value, ImageResponse.self)
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
        else {
            return .pathErr
        }
        
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출합니다.
        case 200: return .success(decodedData)
        case 201: return .success(decodedData)
        case 400..<500: return .requestErr(decodedData)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
