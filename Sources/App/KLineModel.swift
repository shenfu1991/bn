//
//  File.swift
//  
//
//  Created by zhihong Meng on 2021/3/9.
//

import Vapor


struct KlineModel: Content{
    var timeStamp: Int?
    var open: String?
    var high: String?
    var low: String?
    var close: String?
    var vol: String?
    var closeTimeStamp: Int?
    var turnover: Double?
    var numbers: Int?
    var buys: Double?
    var sells: Double?
    var unknow: String?
    
     init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.timeStamp = try? container.decodeIfPresent(Int.self)
        self.open = try? container.decodeIfPresent(String.self)
        self.high = try? container.decodeIfPresent(String.self)
        self.low = try? container.decodeIfPresent(String.self)
        self.close = try? container.decodeIfPresent(String.self)
        self.vol = try? container.decodeIfPresent(String.self)
        self.closeTimeStamp = try? container.decodeIfPresent(Int.self)
        self.turnover = try? container.decodeIfPresent(Double.self)
        self.numbers = try? container.decodeIfPresent(Int.self)
        self.buys = try? container.decodeIfPresent(Double.self)
        self.sells = try? container.decodeIfPresent(Double.self)
        self.unknow = try? container.decodeIfPresent(String.self)
    }
    
    
    
 
}


struct NumModel: Content {
    var num: Int?
    var ev: Double?
}
