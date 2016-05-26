//
//  OppotunityInfo.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/18.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class  OppoInfo {
  
    private var id : Int = -1
    private var name : String = ""
    private var clientId = -1
    private var stage : Int = -1
    private var targetSales : Int = 0
    private var productId : Int = -1
    private var isEnd = false
    
    private var checkList = [Check]()
    
    init(_oppo : OppoInfo) {
        id = _oppo.getId()
        name = _oppo.getName()
        clientId = _oppo.getClientId()
        stage = _oppo.getStage()
        targetSales = _oppo.getTargetSales()
        productId = _oppo.getProductId()
        isEnd = _oppo.isEndOrNot()
        checkList = _oppo.getCheckList()
        userId = _oppo.getUserId()
        comId = _oppo.getComId()
    }
    
    init(){
    }
    
    init(_name : String){
        name = _name
    }
    
    func giveId(){
        id = DataReader.getNewOppoId()
    }
    
    func setId(_id : Int){
        id = _id
    }
    
    func  getId() -> Int {
        return id
    }
    
    func setName(_name : String){
        name = _name
    }
    
    func getName() -> String {
        return name
    }

    func setClientId(_clientId : Int){
        clientId = _clientId
    }
    
    func getClientId() -> Int {
        return clientId
    }
    
    func setStage(_stage : Int){
        stage = _stage
    }
    
    func getStage() -> Int {
        return stage
    }
    
    func setTargetSales(_targetSales : Int){
        targetSales = _targetSales
    }
    
    func getTargetSales() -> Int {
        return targetSales
    }
    
    func setProductId(_productId : Int) {
        productId = _productId
    }
    
    func getProductId() -> Int{
        return productId
    }
    
    func appendList(check : Check){
        checkList.append(check)
    }
    
    func getCheckList() -> [Check] {
        return checkList
    }
    
    func getCheckCount() -> Int {
        return checkList.count
    }
    
    func isEndOrNot() -> Bool {
        return isEnd
    }
    
    func isEndNow(){
        isEnd = true
    }
    
    private var userId = -1
    private var comId = -1
    
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
    
    func setCheckList(_list : [Check]){
        checkList = _list
    }
}

class Check {
    
    private var date = Date.init(YY: -1, MM: -1, DD: -1)
    private var context : String = ""
    
    init(){
        
    }
    
    init(YY : Int, MM : Int, DD : Int, _context : String, _userId : Int) {
        date = Date.init(YY: YY, MM: MM, DD: DD)
        context = _context
        userId = _userId
    }
    
    func setDate(YY : Int, MM : Int, DD : Int) {
        date = Date.init(YY: YY, MM: MM, DD: DD)
    }
    
    func getDate() -> Date {
        return date
    }
    
    func setContext(_context : String){
        context = _context
    }
    
    func getContext() -> String {
        return context
    }
    
    private var userId = -1
    
    func getUserId() -> Int {
        return userId
    }
    
    func setUserId(_id : Int) {
        userId = _id
    }
}

class Date {
    private var year = -1
    private var month = -1
    private var day = -1
    
    init(YY : Int, MM : Int, DD : Int){
        year = YY
        month = MM
        day = DD
    }
    
    func getYear() -> Int {
        return year
    }
    
    func getMonth() -> Int {
        return month
    }
    
    func getDay() -> Int {
        return day
    }
}

//THE STAGE
/*
 0% LOSE IT
 10% 初步接洽
 30% 需求确定
 60% 方案/报价
 80% 谈判审核
 100% 赢单
 */

class Stage {
    static func getContextWithPercentage(index : Int) -> String{
        switch index {
        case 0:
            return "初步接洽(10%)"
        case 1:
            return "确定需求(30%)"
        case 2:
            return "方案/报价(60%)"
        case 3:
            return "谈判审核(80%)"
        case 4:
            return "赢单(100%)"
        case 5:
            return "输单(0%)"
        default:
            return ""
        }
    }
    
    static func getContext(index : Int) -> String{
        switch index {
        case 0:
            return "初步接洽"
        case 1:
            return "确定需求"
        case 2:
            return "方案/报价"
        case 3:
            return "谈判审核"
        case 4:
            return "赢单"
        case 5:
            return "输单"
        default:
            return ""
        }
    }
    
    static func getPercentage(index : Int) -> Int{
        switch index {
        case 0:
            return 10
        case 1:
            return 30
        case 2:
            return 60
        case 3:
            return 80
        case 4:
            return 100
        case 5:
            return 0
        default:
            return -1
        }
    }

}