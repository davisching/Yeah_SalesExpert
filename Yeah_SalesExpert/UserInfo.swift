//
//  UserInfo.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/23.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class UserInfo {
    private var id = -1
    private var userName = ""
    private var password = ""
    private var name = ""
    private var comId = -1
    private var targetSales = 0
    
    init() {
    
    }
    
    init(_userName : String, _password : String) {
        userName = _userName
        password = _password
        id = DataReader.getNewUserId()
    }
    
    func getId() -> Int{
        return id
    }
    
    func setId(_id : Int) {
        id = _id
    }
    
    func getUserName() -> String {
        return userName
    }
    
    func setUserName(_name : String) {
        userName = _name
    }
    
    func getPassword() -> String {
        return password
    }
    
    func setPassword(_pass : String) {
        password = _pass
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(_name : String ) {
        name = _name
    }
    
    func getComId() -> Int {
        return comId
    }
    
    func setComId(_id : Int) {
        comId = _id
    }
    
    func getTargetSales() -> Int {
        return targetSales
    }
    
    func setTargetSales(_sales : Int) {
        targetSales = _sales
    }
}

class CompanyInfo {
    private var id = -1
    private var code = ""
    private var name = ""
    private var userList = [Int]()
    
    init(){
    
    }
    
    func newCode() -> String {
        return randomString(8)
    }
    
    init(_name : String) {
        name = _name
        id = DataReader.getNewComId()
        code = newCode()
    }
    
    func getId() -> Int{
        return id
    }
    
    func setId(_id : Int){
        id = _id
    }
    
    func getCode() -> String {
        return code
    }
    
    func setCode(_code : String) {
        code = _code
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(_name : String) {
        name = _name
    }
    
    func getUserList() -> [Int]{
        return userList
    }
    
    func setUserList(list : [Int]) {
        userList = list
    }
    
    func appendUserList(_id : Int) {
        userList.append(_id)
    }
    
    func removeUser(_id : Int) {
        for i in 0 ..< userList.count {
            if userList[i] == _id {
                userList.removeAtIndex(i)
            }
        }
    }
    
    func random(min : UInt32, max : UInt32) -> UInt32 {
        return  arc4random_uniform(max - min) + min
    }
    
    func randomString(len : Int) -> String {
        let min : UInt32 = 97, max : UInt32 = 122
        var string = ""
        for _ in 0 ..< len {
            string.append(UnicodeScalar(random(min, max : max)))
        }
        return string
    }
}
