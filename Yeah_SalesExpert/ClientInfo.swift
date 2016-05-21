//
//  ClientInfo.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/16.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class ClientInfo {
    
    private var name : String = ""
    private var company = ""
    private var job = ""
    private var mobile = ""
    private var phone = ""
    private var email = ""
    private var checkList = [Check]()
    private var id = 0
    
    init(){
        //do nothing
    }
    
    init(_name : String){
        name = _name
        id = DataReader.getNewClientId()
    }
    
    func getId() -> Int{
        return id
    }
    
    func setId(newId : Int){
        id = newId
    }
    
    func setName(_name : String){
        name = _name
    }
    
    func getName() -> String {
        return name
    }
    
    func setCompany(_company : String){
        company = _company
    }
    
    func getCompany() -> String{
        return company
    }
    
    func setJob(_job : String){
        job = _job
    }
    
    func getJob() -> String{
        return job
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

    func getCheckList() -> [Check] {
        return checkList
    }
    
    func getCheckCount() -> Int {
        return checkList.count
    }
    
    func appendList(check : Check){
        checkList.append(check)
    }
    
}