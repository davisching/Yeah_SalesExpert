//
//  DataReader.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/16.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class DataReader {
    
    private static var clientList = [ClientInfo]()
    
    private static var clientHasChangedFlag = false
    
    //To init data after login
    static func initDataProcess(){
        DataReader.initClientList()
    }
    
    
    static func getClientHasChangedFlag() -> Bool{
        return clientHasChangedFlag
    }
    
    static func clearClientHasChangedFlag(){
        clientHasChangedFlag = false
    }
    
    static func setClientHasChangedFlag(){
        clientHasChangedFlag = true
    }
    
    //To return the count of the clients
    static func getClientCount() -> Int {
        return clientList.count
    }
    
    //To return the list of the clients
    static func getClientList() -> [ClientInfo]{
        return clientList
    }
    
    //init list, will be cancel after using the dataBases
    static func initClientList(){
        let a = ClientInfo.init(_name: "Davis")
        a.setJob("Vice President")
        a.setCompany("Ching Co.")
        a.setMobile("15850532350")
        a.setPhone("02164738291")
        a.setEmail("davisching@yahoo.com")
        let b = ClientInfo.init(_name: "Ching")
        clientList.append(a)
        clientList.append(b)
        clientList.append(ClientInfo.init(_name : "Is"))
        clientList.append(ClientInfo.init(_name : "The Handsome"))
    }
    
    //Append Client List
    static func appendClientList(newClient : ClientInfo){
        clientList.append(newClient)
        clientHasChangedFlag = true
    }
    
    private static var currentClient = ClientInfo.init()
    private static var currentClientIndex = 0
    
    static func getCurrentClientIndex() -> Int{
        return currentClientIndex
    }
    
    static func setCurrentClient(_currentClient : ClientInfo, _currentClientIndex: Int){
        currentClient = _currentClient
        currentClientIndex = _currentClientIndex
    }
    
    static func getCurrentClient() -> ClientInfo{
        return currentClient
    }
    
    static func modifyClientInIndex(_newClient : ClientInfo, _clientIndex : Int){
        clientList[_clientIndex] = _newClient
        clientHasChangedFlag = true
    }
}