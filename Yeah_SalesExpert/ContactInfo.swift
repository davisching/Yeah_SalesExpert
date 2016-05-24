//
//  ContactInfo.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/17.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class ContactInfo {
    
    private var name : String = " "
    private var mobile = " "
    private var phone = " "
    private var email = " "
    private var id = 0
    private var clientId = -1
    
    init(){
    
    }
    
    init(_clientInfo : ClientInfo) {
        name = _clientInfo.getName()
        mobile = _clientInfo.getMobile()
        phone = _clientInfo.getPhone()
        email = _clientInfo.getEmail()
        clientId = _clientInfo.getId()
        id = DataReader.getNewContactId()
    }
    
    init(_name : String) {
        name = _name
        id = DataReader.getNewContactId()
    }
    
    func getId() -> Int{
        return id
    }
    
    func getClientId() -> Int{
        return clientId
    }
    
    func setClientId(newId : Int) {
        clientId = newId
    }
    
    func setId(newId : Int) {
        id = newId
    }
    
    func setName(_name : String){
        name = _name
    }
    
    func getName() -> String {
        return name
    }
    
    func setMobile(_mobile : String){
        mobile = _mobile
    }
    
    func getMobile() -> String{
        return mobile
    }
    
    func setPhone(_phone : String){
        phone = _phone
    }
    
    func getPhone() -> String{
        return phone
    }
    
    func setEmail(_email : String){
        email = _email
    }
    
    func getEmail() -> String{
        return email
    }
    
    private var userId = -1
    
    func getUserId() -> Int {
        return userId
    }
    
    func setUserId(_id : Int) {
        userId = _id
    }
}