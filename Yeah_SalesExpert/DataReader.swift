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
    
    //The list of contacts
    private static var contactList = [ContactInfo]()
    
    //To init data after login
    static func initDataProcess(){
        DataReader.initClientList()
        DataReader.initProductList()
        DataReader.initContactList()
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
        appendClientList(a)
        appendClientList(b)
        appendClientList(ClientInfo.init(_name : "Is"))
        appendClientList(ClientInfo.init(_name : "The Handsome"))
    }
    
    //To init the list of all the products
    static func initProductList(){
        let a = ProductInfo.init(_name: "恒洁卫浴马桶")
        let b = ProductInfo.init(_name: "九牧卫浴马桶")
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
        b.appendImgNames("02_01")
        b.appendImgNames("02_02")
        b.appendImgNames("02_03")
        b.appendImgNames("02_04")
        //b.appendImgNames("02_05")
        //b.appendImgNames("02_06")
        b.appendImgNames("02_07")
        b.appendImgNames("02_08")
        b.appendImgNames("02_09")
        b.appendImgNames("02_10")
        //b.appendImgNames("02_11")
        b.appendImgNames("02_12")
        b.appendImgNames("02_13")
        b.appendImgNames("02_14")
        productList.append(a)
        productList.append(b)
    }
    
    //To init the list of all the contacts
    static func initContactList(){
        let a = ContactInfo.init(_name: "asd")
        let b = ContactInfo.init(_name: "qsd")
        contactList.append(a)
        contactList.append(b)
    }
    
    //To return the count of the clients
    static func getClientCount() -> Int {
        return clientList.count
    }
    
    //To return the count of the products
    static func getProductCount() -> Int {
        return productList.count
    }
    
    //To return the count of the contacts
    static func getContactCount() -> Int {
        return contactList.count
    }
    
    //To return the list of the clients
    static func getClientList() -> [ClientInfo]{
        return clientList
    }
    
    //To return the list of the products
    static func getProductList() -> [ProductInfo]{
        return productList
    }
    
    //To return the list of the contacts
    static func getContactList() -> [ContactInfo]{
        return contactList
    }

    //Append Client List
    static func appendClientList(newClient : ClientInfo){
        clientList.append(newClient)
        appendContactListWithAClient(newClient)
    }
    
    //Append Product List
    static func appendProductList(newProduct : ProductInfo){
        productList.append(newProduct)
    }
    
    //Append Contact List
    static func appendContactList(newContact : ContactInfo){
        contactList.append(newContact)
    }
    
    //Append Contact List With a client
    static func appendContactListWithAClient(newClient : ClientInfo) {
        let newContact = ContactInfo.init(_clientInfo: newClient)
        appendContactList(newContact)
    }
    
    //The current client
    private static var currentClient = ClientInfo.init()
    
    //The current product
    private static var currentProduct = ProductInfo.init()
    
    //The current contact
    private static var currentContact = ContactInfo.init()
    
    //The row count in the client table of this client
    private static var currentClientIndex = 0
    
    //The row count in the product table of this product
    private static var currentProductIndex = 0
    
    //The row count in the product table of this contact
    private static var currentContactIndex = 0
    
    //To get the row count of this client in the client table
    static func getCurrentClientIndex() -> Int{
        return currentClientIndex
    }
    
    //To get the row count of this product in the product table
    static func getCurrentProductIndex() -> Int{
        return currentProductIndex
    }
    
    //To get the row count of this contact in the contact table
    static func getCurrentContactIndex() -> Int{
        return currentContactIndex
    }
    
    //To set the current client to this Data reader
    static func setCurrentClient(_currentClient : ClientInfo, _currentClientIndex: Int){
        currentClient = _currentClient
        currentClientIndex = _currentClientIndex
    }
    
    //To set the current product to this Data reader
    static func setCurrentProduct(_currentProduct : ProductInfo, _currentProductIndex: Int){
        currentProduct = _currentProduct
        currentProductIndex = _currentProductIndex
    }
    
    //To set the current contact to this Data reader
    static func setCurrentContact(_currentContact : ContactInfo, _currentContactIndex: Int){
        currentContact = _currentContact
        currentContactIndex = _currentContactIndex
    }
    
    //To return the current client to app
    static func getCurrentClient() -> ClientInfo{
        return currentClient
    }
    
    //To return the current product to app
    static func getCurrentProduct() -> ProductInfo{
        return currentProduct
    }
    
    //To return the current contact to app
    static func getCurrentContact() -> ContactInfo{
        return currentContact
    }
    
    //To modify the information of a client
    static func modifyClientInIndex(_newClient : ClientInfo, _clientIndex : Int){
        clientList[_clientIndex] = _newClient
        modifyContactWithAClient(_newClient)
    }
    
    //To modify the information of a contact
    static func modifyContactInIndex(_newContact : ContactInfo, _contactIndex : Int){
        contactList[_contactIndex] = _newContact
        modifyClientWithAContact(_newContact)
    }
    
    //To modify the information of a contact with a client
    static func modifyContactWithAClient(_newClient : ClientInfo){
        for i in 0 ..< contactList.count {
            if contactList[i].getClientId() == _newClient.getId() {
                contactList[i] = ContactInfo.init(_clientInfo: _newClient)
            }
        }
    }
    
    //To modify the information of a client with a contact
    static func modifyClientWithAContact(_newContact : ContactInfo){
        for i in 0 ..< clientList.count {
            if clientList[i].getId() == _newContact.getClientId() {
                let newClient = clientList[i]
                newClient.setName(_newContact.getName())
                newClient.setMobile(_newContact.getMobile())
                newClient.setPhone(_newContact.getPhone())
                newClient.setEmail(_newContact.getEmail())
                clientList[i] = newClient
            }
        }
    }
    
    //The id of next client
    private static var nextClientId = 0
    
    //The id of next product
    private static var nextProductId = 0
    
    //The id of next contact
    private static var nextContactId = 0
    
    //to give the new client a id 
    static func getNewClientId() -> Int{
        nextClientId += 1
        return nextClientId
    }

    //to give the new product a id
    static func getNewProductId() -> Int{
        nextProductId += 1
        return nextProductId
    }

    //to give the new contact a id
    static func getNewContactId() -> Int{
        nextContactId += 1
        return nextContactId
    }
    
//    //Get a Client with its id
//    static func getClientById(_id : Int) -> ClientInfo{
//        for i in 0 ..< getClientCount() {
//            if clientList[i].getId() == _id {
//                return clientList[i]
//            }
//        }
//        return ClientInfo.init()
//    }
}