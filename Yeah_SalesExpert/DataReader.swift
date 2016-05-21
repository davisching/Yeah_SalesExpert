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
    
    //The list of oppotunities
    private static var oppoList = [OppoInfo]()
    
    //To init data after login
    static func initDataProcess(){
        DataReader.initClientList()
        DataReader.initProductList()
        DataReader.initContactList()
        DataReader.initOppoList()
    }
    
    //init list, will be cancel after using the dataBases
    static func initClientList(){
        let a = ClientInfo.init(_name: "郑新")
        a.setJob("总经理")
        a.setCompany("上海超新幼儿用品有限公司")
        a.setMobile("15850532311")
        a.setPhone("02164738291")
        a.setEmail("xinsuparim@gmail.com")
        let b = ClientInfo.init(_name: "丘小姐")
        b.setJob("采购总管")
        b.setCompany("厦门秋之城儿童商贸有限公司")
        b.setMobile("13810928102")
        b.setPhone("059234732217")
        b.setEmail("qiuQZC@163.com")
        appendClientList(a)
        appendClientList(b)
    }
    
    //To init the list of all the products
    static func initProductList(){
        let a = ProductInfo.init(_name: "杰利卡儿童绘本")
        let b = ProductInfo.init(_name: "太空猴儿童益智积木")
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
        let a = ContactInfo.init(_name: "王杰")
        a.setEmail("Wangnim@qq.com")
        a.setPhone("02563811931")
        a.setMobile("15850239164")
        contactList.append(a)
    }
    
    //To init the list of all the oppotunities
    static func initOppoList() {
        let a = OppoInfo.init(_name: "太空猴益智玩具")
        a.setStage(3)
        a.setClientId(1)
        a.setProductId(2)
        a.setTargetSales(50000)
        a.giveId()
        a.appendList(Check.init(YY: 2016, MM: 4, DD: 19, _context: "我在这一天创建了这个销售机会。"))
        a.appendList(Check.init(YY: 2016, MM: 4, DD: 21, _context: "我在这一天第一次拜访了这个客户。"))
        oppoList.append(a)
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
    
    //To return the count of the oppotunities
    static func getOppoCount() -> Int {
        return oppoList.count
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
    
    //To return the list of the oppotunities
    static func getOppoList() -> [OppoInfo] {
        return oppoList
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
    
    //To append the list of oppotunities
    static func appendOppoList(newOppo : OppoInfo) {
       oppoList.append(newOppo)
    }
    
    //The current client
    private static var currentClient = ClientInfo.init()
    
    //The current product
    private static var currentProduct = ProductInfo.init()
    
    //The current contact
    private static var currentContact = ContactInfo.init()
    
    //The current oppotunity
    private static var currentOppo = OppoInfo.init()
    
    //The row count in the client table of this client
    private static var currentClientIndex = 0
    
    //The row count in the product table of this product
    private static var currentProductIndex = 0
    
    //The row count in the contact table of this contact
    private static var currentContactIndex = 0
    
    //The row count in the oppotunity table of this oppotunity
    private static var currentOppoIndex = 0
    
    //To get the row count of this client in the client table
    static func getCurrentClientIndex() -> Int{
        return currentClientIndex
    }
    
    //To get the index of this client in the client list with its id
    static func getCurrentClientIndex(clientId : Int) -> Int {
        for i in 0 ..< clientList.count {
            if clientList[i].getId() == clientId {
                return i
            }
        }
        return -1
    }
    
    //To get the index of this product in the client list with its id
    static func getCurrentProductIndex(productId : Int) -> Int {
        for i in 0 ..< productList.count {
            if productList[i].getId() == productId {
                return i
            }
        }
        return -1
    }
    
    
    //To get the row count of this product in the product table
    static func getCurrentProductIndex() -> Int{
        return currentProductIndex
    }
    
    //To get the row count of this contact in the contact table
    static func getCurrentContactIndex() -> Int{
        return currentContactIndex
    }
    
    //To get the row count of this oppotunity in the oppotunity table
    static func getCurrentOppoIndex() -> Int {
        return currentOppoIndex
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
    
    //To set the current oppotunity to this Data readr
    static func setCurrentOppo(_currentOppo : OppoInfo, _currentOppoIndex : Int){
        currentOppo = _currentOppo
        currentOppoIndex = _currentOppoIndex
    }
    
    //To return the current client to app
    static func getCurrentClient() -> ClientInfo {
        return currentClient
    }

    //To return the current product to app
    static func getCurrentProduct() -> ProductInfo {
        return currentProduct
    }
    
    //To return the current contact to app
    static func getCurrentContact() -> ContactInfo {
        return currentContact
    }
    
    //To return the current oppotunity to app
    static func getCurrentOppo() -> OppoInfo {
        return currentOppo
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
    
    //To modify the information of a oppotunity
    static func modifyOppo(_newOppo : OppoInfo, _oppoIndex : Int) {
        oppoList[_oppoIndex] = _newOppo
        setCurrentOppo(_newOppo, _currentOppoIndex: _oppoIndex)
    }
    
    //The id of next client
    private static var nextClientId = 0
    
    //The id of next product
    private static var nextProductId = 0
    
    //The id of next contact
    private static var nextContactId = 0
    
    //The id of next oppo
    private static var nextOppoId = 0
    
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
    
    //To give the new oppotunity a id
    static func getNewOppoId() -> Int {
        nextOppoId += 1
        return nextOppoId
    }
    
    //The client which user will select or have selected
    private static var selectedClient = ClientInfo.init()
    
    //The stage which user will select or have selected
    private static var selectedStage = -1
    
    //The product which user will select or have selected
    private static var selectedProduct = ProductInfo.init()
    
    //To set the selected client
    static func setSelectedClient(_client : ClientInfo) {
        selectedClient = _client
    }
    
    //To get the selected client
    static func getSelectedClient() -> ClientInfo {
        return selectedClient
    }
    
    //To set the selected stage
    static func setSelectedStage(_stage : Int) {
        selectedStage = _stage
    }
    
    //To get the selected stage
    static func getSelectedStage() -> Int{
        return selectedStage
    }
    
    //To set the selected product
    static func setSelectedProduct(_product : ProductInfo) {
        selectedProduct = _product
    }
    
    //To get the selected product
    static func getSelectedProduct() -> ProductInfo{
        return selectedProduct
    }
    
    //Clear all selected
    static func clearAllSelected() {
        setSelectedClient(ClientInfo.init())
        setSelectedProduct(ProductInfo.init())
        setSelectedStage(-1)
    }
    
    //To tell whether the process is act during creating an oppotunity
    static var isCreatingAnOppotunity = false
    
    //To tell whether the process is act during modifing an oppotunity
    static var isModifyingAnOppotunity = false
    
    //To return this value to its initialize value
    static func clearIsCreatingAnOppotunity() {
        isCreatingAnOppotunity = false
    }
    
    //To return this value to its initialize value
    static func clearIsModifyingAnOppotunity() {
        isModifyingAnOppotunity = false
    }
    
    //getawaynNaviBarDIVIDEscreen
    static func getAwayNaviBarDIVIDEscreen(width : CGFloat) -> CGFloat{
        if width > 375 {
            return (667 - 102) / 667
        } else {
            return (667 - 112) / 667

        }
    }
    
    //To get the client with its id
    static func getClientWithId(clientId : Int) -> ClientInfo {
        for i in 0 ..< clientList.count {
            if clientList[i].getId() == clientId {
                return clientList[i]
            }
        }
        return ClientInfo.init()
    }
    
    //To get the product with its id
    static func getProductWithId(productId : Int) -> ProductInfo {
        for i in 0 ..< productList.count {
            if productList[i].getId() == productId {
                return productList[i]
            }
        }
        return ProductInfo.init()
    }
    
    //To get the contact with its id
    static func getContactWithId(contactId : Int) -> ContactInfo {
        for i in 0 ..< contactList.count {
            if contactList[i].getId() == contactId {
                return contactList[i]
            }
        }
        return ContactInfo.init()
    }
    
    //To get the oppotunity with its id
    static func getOppotunityWithId(oppoId : Int) -> OppoInfo {
        for i in 0 ..< oppoList.count {
            if oppoList[i].getId() == oppoId {
                return oppoList[i]
            }
        }
        return OppoInfo.init()
    }
    
    //The current stage
    private static var currentStage = -1
    
    //To set the current stage
    static func setCurrentStage(_stage : Int) {
        currentStage = _stage
    }
    
    //To get the current stage
    static func getCurrentStage() -> Int {
       return currentStage
    }
}