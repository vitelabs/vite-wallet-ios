//
//  GetDexMiningStakeInfoRequest.swift
//  ViteWallet
//
//  Created by Stone on 2020/6/4.
//

import Foundation
import JSONRPCKit

public struct GetDexMiningStakeInfoRequest: JSONRPCKit.Request {
    public typealias Response = DexMiningStakeInfo

    let address: ViteAddress
    let index: Int
    let count: Int

    public var method: String {
        return "dex_getMiningStakeInfoList"
    }

    public var parameters: Any? {
        return [address, index, count]
    }

    public init(address: ViteAddress, index: Int, count: Int) {
        self.address = address
        self.index = index
        self.count = count
    }

    public func response(from resultObject: Any) throws -> Response {
         if let response = resultObject as? [String: Any] {
            if let ret = DexMiningStakeInfo(JSON: response) {
                return ret
            } else {
                throw ViteError.JSONTypeError
            }
        } else {
            throw ViteError.JSONTypeError
        }
    }
}
