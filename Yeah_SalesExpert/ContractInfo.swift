//
//  ContractInfo.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/31.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class ContractInfo {
    
    private var id = -1
    private var name = ""
    private var oppoId = -1
    private var contractStage = -1
    private var payWay = -1
    private var date = Date.init(YY: 10, MM: 10, DD: 10)
    private var note = ""
    private var userId = -1
    private var comId = -1
    
    init(_name : String) {
        name = _name
        
    }
    
    init() {
    
    }
    
    func setId(_id : Int) {
        id = _id
    }
    
    func getId() -> Int {
        return id
    }
    
    func setName(_name : String) {
        name = _name
    }
    
    func getName() -> String {
        return name
    }
 
    func setOppoId(_id : Int) {
        oppoId = _id
    }
    
    func getOppoId() -> Int {
        return oppoId
    }
    
    func setContractStage(_stage : Int) {
        contractStage = _stage
    }
    
    func getContractStage() -> Int {
        return contractStage
    }
    
    func setPayWay(_way : Int) {
        payWay = _way
    }
    
    func getPayWay() -> Int {
        return payWay
    }
    
    func setDate(_year : Int, _month : Int, _day : Int) {
        date = Date.init(YY: _year, MM: _month, DD: _day)
    }
    
    func getDate() -> Date{
        return date
    }
    
    func setNote(_note : String) {
        note = _note
    }
    
    func getNote() -> String {
        return note
    }
    
    func getUserId() -> Int {
        return userId
    }
    
    func setUserId(_id : Int) {
        userId = _id
    }
    
    func getComId() -> Int {
        return comId
    }
    
    func setComId(_id : Int) {
        comId = _id
    }
}

class ContractStage {
    static func getContractStageString(index : Int) -> String {
        switch index {
        case 0 :
            return "未开始"
        case 1 :
            return "执行中"
        case 2 :
            return "成功结束"
        default:
            return "意外终止"
        }
    }
}

class PayWay {
    static func getPayWayString(index : Int) -> String {
        switch index {
        case 0 :
            return "现金支付"
        case 1 :
            return "邮寄支付"
        case 2 :
            return "在线支付"
        default:
            return "银行转账"
        }
    }
}