//
//  Model.swift
//  RxNewYorkTimes
//
//  Created by omair khan on 15/12/2021.
//

import Foundation

public struct TopStoriesResponse : Codable {
    let results : [Results]
}

public struct Results : Codable {
    
    let title : String
    let abstract : String
    let multimedia : [Media]?
}

public struct Media : Codable {
    let url : String
}
