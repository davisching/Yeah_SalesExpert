//
//  DataReader.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/16.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class DataReader {
    
    //The list of clients
    private static var clientList = [ClientInfo]()
    
    //The list of products
    private static var productList = [ProductInfo]()
    
    //To init data after login
    static func initDataProcess(){
        DataReader.initClientList()
        DataReader.initProductList()
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
    }
    
    //The current client
    private static var currentClient = ClientInfo.init()
    
    //The row count in the client table of this client
    private static var currentClientIndex = 0
    
    //To get the row count of this client in the client table
    static func getCurrentClientIndex() -> Int{
        return currentClientIndex
    }
    
    //To set the current client to this Data reader
    static func setCurrentClient(_currentClient : ClientInfo, _currentClientIndex: Int){
        currentClient = _currentClient
        currentClientIndex = _currentClientIndex
    }
    
    //To return the current client to app
    static func getCurrentClient() -> ClientInfo{
        return currentClient
    }
    
    //To modify the information of a client
    static func modifyClientInIndex(_newClient : ClientInfo, _clientIndex : Int){
        clientList[_clientIndex] = _newClient
    }
    
    //The id of next client
    private static var nextClientId = 0
    
    //to give the new client a id 
    static func getNewClientId() -> Int{
        nextClientId += 1
        return nextClientId
    }

    //To init the list of all the products
    static func initProductList(){
        let a = ProductInfo.init(_name: "恒洁卫浴118马桶")
        let b = ProductInfo.init(_name: "农夫山泉")
        a.appendImgNames("01_01")
        a.appendImgNames("01_02")
        a.appendImgNames("01_03")
        a.appendImgNames("01_04")
        a.appendImgNames("01_05")
        a.appendImgNames("01_06")
        a.appendImgNames("01_07")
        a.appendImgNames("01_08")
        a.appendImgNames("01_09")
        a.appendImgNames("01_10")
        a.appendImgNames("01_11")
        a.appendImgNames("01_12")
        productList.append(a)
        productList.append(b)
    }
    
    //To return the count of the products
    static func getProductCount() -> Int {
        return productList.count
    }
    
    //To return the list of the products
    static func getProductList() -> [ProductInfo]{
        return productList
    }
    
    //Append Product List
    static func appendProductList(newProduct : ProductInfo){
        productList.append(newProduct)
    }
    
    //The current product
    private static var currentProduct = ProductInfo.init()
    
    //The row count in the product table of this product
    private static var currentProductIndex = 0
    
    //To get the row count of this product in the product table
    static func getCurrentProductIndex() -> Int{
        return currentProductIndex
    }
    
    //To set the current product to this Data reader
    static func setCurrentProduct(_currentProduct : ProductInfo, _currentProductIndex: Int){
        currentProduct = _currentProduct
        currentProductIndex = _currentProductIndex
    }
    
    //To return the current product to app
    static func getCurrentProduct() -> ProductInfo{
        return currentProduct
    }
    
    //The id of next product
    private static var nextProductId = 0
    
    //to give the new product a id
    static func getNewProductId() -> Int{
        nextProductId += 1
        return nextProductId
    }


    
}