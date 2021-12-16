//
//  TopStoriesViewModel.swift
//  RxNewYorkTimes
//
//  Created by omair khan on 15/12/2021.
//

import Foundation
import RxSwift
import RxCocoa

// Root View Model will display all the results on View

struct TopStoriesListViewModel {
    let topStoriesList = PublishSubject<[Results]>()
    
}


extension TopStoriesListViewModel {
    
    
    func fetchItems(disposeBag : DisposeBag) {
        let resource = Resource<TopStoriesResponse>.init(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=wZ6nNutGYhiI7LDJQUCTva0k88twlGep")!)
        URLRequest.loadRequest(resource: resource).subscribe(onNext : { result in
            
            let results = result.results
            topStoriesList.onNext(results)
            
            topStoriesList.onCompleted()
        }).disposed(by: disposeBag)
    }
}


