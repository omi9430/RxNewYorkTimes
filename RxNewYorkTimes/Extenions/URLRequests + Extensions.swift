//
//  URLRequests + Extensions.swift
//  RxNewYorkTimes
//
//  Created by omair khan on 15/12/2021.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T:Decodable>{
    let url : URL
}

extension URLRequest {
    
    static func loadRequest<T>(resource : Resource<T>) -> Observable<T>{
        
        return Observable.just(resource.url)
            .flatMap{ url -> Observable<Data> in
                let request =  URLRequest(url: url)
                return URLSession.shared.rx.data(request:request)
            }
            .map{ data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
    
}
