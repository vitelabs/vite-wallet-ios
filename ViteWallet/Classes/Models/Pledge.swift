//
//  Pledge.swift
//  Vite
//
//  Created by Stone on 2018/10/25.
//  Copyright © 2018年 vite labs. All rights reserved.
//

import Foundation
import ObjectMapper
import BigInt

public struct Pledge: Mappable {

    public fileprivate(set) var beneficialAddress = ""
    public fileprivate(set) var amount = Amount(0)
    public fileprivate(set) var timestamp = Date(timeIntervalSince1970: 0)
    public fileprivate(set) var withdrawHeight: UInt64 = 0

    public fileprivate(set) var agent = false
    public fileprivate(set) var agentAddress = ""
    public fileprivate(set) var bid: UInt8 = 0

    public init?(map: Map) { }

    public mutating func mapping(map: Map) {
        beneficialAddress <- map["beneficialAddr"]
        amount <- (map["amount"], JSONTransformer.balance)
        timestamp <- (map["withdrawTime"], JSONTransformer.timestamp)
        withdrawHeight <- (map["withdrawHeight"], JSONTransformer.uint64)

        agent <- map["agent"]
        agentAddress <- map["agentAddress"]
        bid <- map["bid"]
    }
}
