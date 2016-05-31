//
//  DataReader.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/16.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class DataReader {
    
    //  1. All the list of the datas
    //The list of users
    private static var userList = [UserInfo]()
    
    //The list of companys
    private static var comList = [CompanyInfo]()
    
    //The list of clients
    private static var clientList = [ClientInfo]()
    
    //The list of products
    private static var productList = [ProductInfo]()
    
    //The list of contacts
    private static var contactList = [ContactInfo]()
    
    //The list of oppotunities
    private static var oppoList = [OppoInfo]()
    
    //The list of contracts
    private static var contractList = [ContractInfo]()
    
    //To set the list of all the users
    static func setUserList(list : [UserInfo]) {
        userList = list
    }
    
    //To get the list of all the users
    static func getUserList() -> [UserInfo] {
        return userList
    }
    
    //To set the list of all the companys
    static func setComList(list : [CompanyInfo]) {
        comList = list
    }
    
    //To get the list of all the companys
    static func getComList() -> [CompanyInfo] {
        return comList
    }
    
    //To return the list of the clients
    static func getClientList() -> [ClientInfo]{
        return clientList
    }
    
    static func setClientList(_clientList : [ClientInfo]){
        clientList = _clientList
    }
    
    //To return the list of the products
    static func getProductList() -> [ProductInfo]{
        return productList
    }
    
    //To set the list of contacts
    static func setContactList(list : [ContactInfo]) {
        contactList = list
    }
    
    //To set the list of contracts
    static func setContractList(list : [ContractInfo]) {
        contractList = list
    }
    
    //To return the list of the contracts
    static func getContractList() -> [ContractInfo]{
        return contractList
    }
    
    //To return the list of the contacts
    static func getContactList() -> [ContactInfo]{
        return contactList
    }
    
    //To set the list of the oppotunities
    static func setOppoList(list : [OppoInfo]){
        oppoList = list
    }
    
    //To return the list of the oppotunities
    static func getOppoList() -> [OppoInfo] {
        return oppoList
    }
    
    /*
        Client      USER / COM
     
        Oppotunity  USER / COM
     
        Contact     USER
     
        Product     COM
     
        Contract    USER / COM
     */
    
    //To get the list of clients for a user by user's id
    static func getClientListForCurrentUser() -> [ClientInfo] {
        var list = [ClientInfo]()
        for _client : ClientInfo in clientList {
            if _client.getUserId() == currentUser.getId() {
                list.append(_client)
            }
        }
        return list
    }
    
    //To get the list of clients for a company by the id of this company
    static func getClientListForCurrentCom() -> [ClientInfo] {
        var list = [ClientInfo]()
        for _client : ClientInfo in clientList {
            if _client.getComId() == currentCom.getId() {
                list.append(_client)
            }
        }
        return list
    }
    
    //To get the list of oppotunities for a user by the id of this user
    static func getOppoListForCurrentUser() -> [OppoInfo] {
        var list = [OppoInfo]()
        for _oppo : OppoInfo in oppoList {
            if _oppo.getUserId() == currentUser.getId() {
                list.append(_oppo)
            }
        }
        return list
    }
    
    //To get the list of oppotunities for a company by the id of this company
    static func getOppoListForCurrentCom() -> [OppoInfo] {
        var list = [OppoInfo]()
        for _oppo : OppoInfo in oppoList {
            if _oppo.getComId() == currentCom.getId() {
                list.append(_oppo)
            }
        }
        return list
    }
    
    //To get the list of contacts for a user by the id of this user
    static func getContactListForCurrentUser() -> [ContactInfo] {
        var list = [ContactInfo]()
        for _contact : ContactInfo in contactList {
            if _contact.getUserId() == currentUser.getId() {
                list.append(_contact)
            }
        }
        return list
    }
    
    //To get the list of products for a company by the id of this company
    static func getProductListForCurrentCom() -> [ProductInfo] {
        var list = [ProductInfo]()
        for _product : ProductInfo in productList {
            if _product.getComId() == currentProduct.getComId() {
                list.append(_product)
            }
        }
        return list
    }
    
    //To get the list of oppotunities for a client by this client's id
    static func getOppoListForCurrentClient() -> [OppoInfo] {
        var list = [OppoInfo]()
        for _oppo : OppoInfo in oppoList {
            if _oppo.getClientId() == currentClient.getId() {
                list.append(_oppo)
            }
        }
        return list
    }
    
    //To get the list of contracts for a user by user's id
    static func getContractListForCurrentUser() -> [ContractInfo] {
        var list = [ContractInfo]()
        for _contact : ContractInfo in contractList {
            if _contact.getUserId() == currentUser.getId() {
                list.append(_contact)
            }
        }
        return list
    }
    
    //To get the list of contracts for a company by the id of this company
    static func getContractListForCurrentCom() -> [ContractInfo] {
        var list = [ContractInfo]()
        for _contact : ContractInfo in contractList {
            if _contact.getComId() == currentCom.getId() {
                list.append(_contact)
            }
        }
        return list
    }
    
    //To get the list of contracts for a client by this client's id
    static func getContractListForCurrentClient() -> [ContractInfo] {
        var list = [ContractInfo]()
        for _contact : ContractInfo in contractList {
            if getOppotunityWithId(_contact.getOppoId()).getClientId() == currentClient.getId() {
                list.append(_contact)
            }
        }
        return list
    }

    
    //  2. The current datas
    //The current user
    private static var currentUser = UserInfo.init()
    
    //The current company
    private static var currentCom = CompanyInfo.init()
    
    //The current client
    private static var currentClient = ClientInfo.init()
    
    //The current product
    private static var currentProduct = ProductInfo.init()
    
    //The current contact
    private static var currentContact = ContactInfo.init()
    
    //The current oppotunity
    private static var currentOppo = OppoInfo.init()
    
    //The current contract
    private static var currentContract = ContractInfo.init()
    
    //To set the current user and set the current company at the same time
    static func setCurrentUser(_user : UserInfo) {
        currentUser = _user
        setCurrentCom(currentUser.getComId())
    }
    
    //To get the current user
    static func getCurrentUser() -> UserInfo {
        return currentUser
    }
    
    //To set the current company
    static func setCurrentCom(id : Int) {
        currentCom = getComById(id)
    }
    
    //To get the current company
    static func getCurrentCom() -> CompanyInfo {
        return currentCom
    }
    
    //To set the current client to this Data reader
    static func setCurrentClient(_currentClient : ClientInfo){
        currentClient = _currentClient
    }
    
    //To return the current client to app
    static func getCurrentClient() -> ClientInfo {
        return currentClient
    }
    
    //To set the current product to this Data reader
    static func setCurrentProduct(_currentProduct : ProductInfo){
        currentProduct = _currentProduct
    }
    
    //To return the current product to app
    static func getCurrentProduct() -> ProductInfo {
        return currentProduct
    }
    
    //To set the current contact to this Data reader
    static func setCurrentContact(_currentContact : ContactInfo){
        currentContact = _currentContact
    }
    
    //To return the current contact to app
    static func getCurrentContact() -> ContactInfo {
        return currentContact
    }
    
    //To set the current oppotunity to this Data readr
    static func setCurrentOppo(_currentOppo : OppoInfo){
        currentOppo = _currentOppo
    }
    
    //To return the current oppotunity to app
    static func getCurrentOppo() -> OppoInfo {
        return currentOppo
    }
    
    //To set the current contract to this Data reader
    static func setCurrentContract(_currentContract : ContractInfo){
        currentContract = _currentContract
    }
    
    //To return the current contract to app
    static func getCurrentContract() -> ContractInfo {
        return currentContract
    }
    
    //  3. To append the lists
    //To append the list of user
    static func appendUserList(_user : UserInfo) {
        userList.append(_user)
        getComById(_user.getComId()).appendUserList(_user.getId())
        saveAllToWeb()
    }
    
    //To append the list of company
    static func appendComList(_com : CompanyInfo, _user : UserInfo) {
        comList.append(_com)
        _user.setComId(_com.getId())
        userList.append(_user)
        saveAllToWeb()
    }
    
    //Append Client List
    static func appendClientList(newClient : ClientInfo){
        let today:NSDate = NSDate()
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "YYYY"
        let year = Int(dateFormatter.stringFromDate(today))
        dateFormatter.dateFormat = "MM"
        let month = Int(dateFormatter.stringFromDate(today))
        dateFormatter.dateFormat = "dd"
        let day = Int(dateFormatter.stringFromDate(today))
        newClient.appendList(Check.init(YY: year!, MM: month!, DD: day!, _context: "我创建了客户: \(newClient.getName())。", _userId : DataReader.getCurrentUser().getId()))
        clientList.append(newClient)
        appendContactListWithAClient(newClient)
    }
    
    //Append Product List
    static func appendProductList(newProduct : ProductInfo){
        productList.append(newProduct)
        saveAllToWeb()
    }
    
    //Append Contact List
    static func appendContactList(newContact : ContactInfo){
        contactList.append(newContact)
        saveAllToWeb()
    }
    
    //Append Contact List With a client
    static func appendContactListWithAClient(newClient : ClientInfo) {
        let newContact = ContactInfo.init(_clientInfo: newClient)
        appendContactList(newContact)
    }
    
    //To append the list of oppotunities
    static func appendOppoList(newOppo : OppoInfo) {
        let today:NSDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY"
        let year = Int(dateFormatter.stringFromDate(today))
        dateFormatter.dateFormat = "MM"
        let month = Int(dateFormatter.stringFromDate(today))
        dateFormatter.dateFormat = "dd"
        let day = Int(dateFormatter.stringFromDate(today))
        newOppo.appendList(Check.init(YY: year!, MM: month!, DD: day!, _context: "我创建了销售机会: \(newOppo.getName())。", _userId : DataReader.getCurrentUser().getId()))
        
        DataReader.getClientWithId(newOppo.getClientId()).appendList(Check.init(YY: year!, MM: month!, DD: day!, _context: "我创建了销售机会: \(newOppo.getName())，已经与此客户绑定。", _userId : DataReader.getCurrentUser().getId()))
        
        oppoList.append(newOppo)
        saveAllToWeb()
    }
    
    //To append the list of contracts
    static func appendContractList(newContract : ContractInfo) {
        let today:NSDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY"
        let year = Int(dateFormatter.stringFromDate(today))
        dateFormatter.dateFormat = "MM"
        let month = Int(dateFormatter.stringFromDate(today))
        dateFormatter.dateFormat = "dd"
        let day = Int(dateFormatter.stringFromDate(today))
        newContract.setDate(year!, _month: month!, _day: day!)
        contractList.append(newContract)
        saveAllToWeb()
    }
    
    // 4.   To modify the lists
    //To modify the information of a client
    static func modifyClient(_newClient : ClientInfo){
        for i in 0 ..< clientList.count {
            if _newClient.getId() == clientList[i].getId() {
                clientList[i] = _newClient
                if flagxx < 1 {
                    modifyContactWithAClient(_newClient)
                } else {
                    flagxx = 0
                    saveAllToWeb()
                }
            }
        }
    }
    
    //To modify the information of a contact
    static func modifyContact(_newContact : ContactInfo){
        for i in 0 ..< contactList.count {
            if _newContact.getId() == contactList[i].getId() {
                contactList[i] = _newContact
                if flagxx < 1 {
                    modifyClientWithAContact(_newContact)
                } else {
                    flagxx = 0
                    saveAllToWeb()
                }
            }
        }
    }
    
    //The flag tell whether some processes have been acted or not
    static var flagxx = 0
    
    //To modify the information of a contact with a client
    static func modifyContactWithAClient(_newClient : ClientInfo){
        for i in 0 ..< contactList.count {
            if contactList[i].getClientId() == _newClient.getId() {
                contactList[i].setEmail(_newClient.getEmail())
                contactList[i].setPhone(_newClient.getPhone())
                contactList[i].setMobile(_newClient.getMobile())
                flagxx += 1
                modifyContact(contactList[i])
            }
        }
    }
    
    //To modify the information of a client with a contact
    static func modifyClientWithAContact(_newContact : ContactInfo){
        for i in 0 ..< clientList.count {
            if clientList[i].getId() == _newContact.getClientId() {
                clientList[i].setMobile(_newContact.getMobile())
                clientList[i].setPhone(_newContact.getPhone())
                clientList[i].setEmail(_newContact.getEmail())
                flagxx += 1
                modifyClient(clientList[i])
            }
        }
    }
    
    //To modify the information of a oppotunity
    static func modifyOppo(_newOppo : OppoInfo) {
        for i in 0 ..< oppoList.count {
            if oppoList[i].getId() == _newOppo.getId() {
                oppoList[i] = _newOppo
                setCurrentOppo(_newOppo)
                saveAllToWeb()
            }
        }
    }
    
    //To modify a user
    static func modifyUser(_user : UserInfo) {
        for i in 0 ..< userList.count {
            if userList[i].getId() == _user.getId() {
                userList[i] = _user
                currentUser = _user
                saveAllToWeb()
            }
        }
    }
    
    //To modify a contract
    static func modifyContract(_contract : ContractInfo) {
        for i in 0 ..< contractList.count {
            if contractList[i].getId() == _contract.getId() {
                contractList[i] = _contract
                currentContract = _contract
                saveAllToWeb()
            }
        }
    }
    
    // 5.   To delete a element from a list
    //A list to reserve those clients who has been deleted
    static var delClientList = [ClientInfo]()
    
    //To delete one client
    static func delCurrentClient() {
        delClientList.append(getCurrentClient())
        for i in 0 ..< clientList.count {
            if clientList[i].getId() == currentClient.getId() {
                clientList.removeAtIndex(i)
                saveAllToWeb()
            }
        }
    }
    
    //To delete one contract
    static func delCurrentContract() {
        for i in 0 ..< contractList.count {
            if contractList[i].getId() == currentContract.getId() {
                contractList.removeAtIndex(i)
                saveAllToWeb()
            }
        }
    }
    
    //To get a client from a list where the client has been deleted
    static func getClientFromDelList(_id : Int) -> ClientInfo {
        for i in 0 ..< delClientList.count {
            if delClientList[i].getId() == _id {
                return delClientList[i]
            }
        }
        return ClientInfo.init()
    }
    
    // 6.   To get a single element in a list
    //To get a company by its id
    static func getComById(id : Int) -> CompanyInfo {
        for i in 0 ..< comList.count {
            if id == comList[i].getId() {
                return comList[i]
            }
        }
        return CompanyInfo.init()
    }
    
    //To get a company by its code
    static func getComByCode(code : String) -> CompanyInfo {
        for i in 0 ..< comList.count {
            if code == comList[i].getCode() {
                return comList[i]
            }
        }
        return CompanyInfo.init()
    }
    
    //To get a user by its username
    static func getUserByUserName(userName : String) -> UserInfo {
        for i in 0 ..< userList.count {
            if userName == userList[i].getUserName() {
                return userList[i]
            }
        }
        return UserInfo.init()
    }
    
    //To get a user by its id
    static func getUserById(id : Int) -> UserInfo {
        for i in 0 ..< userList.count {
            if id == userList[i].getId() {
                return userList[i]
            }
        }
        return UserInfo.init()
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
    
    //To get the contract with its id
    static func getContractWithId(id : Int) -> ContractInfo {
        for _contract : ContractInfo in contractList {
            if _contract.getId() == id {
                return _contract
            }
        }
        return ContractInfo.init()
    }
    
    // 7.   The process for IDs
    //The id of next client
    private static var nextClientId = 0
    
    //The id of next product
    private static var nextProductId = 0
    
    //The id of next contact
    private static var nextContactId = 0
    
    //The id of next oppo
    private static var nextOppoId = 0
    
    //The id of next user
    private static var nextUserId = 0
    
    //The id of next com
    private static var nextComId = 0
    
    //The id of next contract 
    private static var nextContractId = 0
    
    //To set the nextIDs
    static func setNextId(index : Int, value : Int) {
        switch index {
        case 0 :
            nextClientId = value
        case 1:
            nextProductId = value
        case 2 :
            nextContactId = value
        case 3 :
            nextOppoId = value
        case 4 :
            nextUserId = value
        case 5 :
            nextComId = value
        default:
            nextContractId = value
        }
    }
    
    //To get the nextIDs
    static func getID(index : Int) -> Int{
        switch index {
        case 0 :
            return nextClientId
        case 1:
            return nextProductId
        case 2 :
            return nextContactId
        case 3 :
            return nextOppoId
        case 4 :
            return nextUserId
        case 5 :
            return nextComId
        default:
            return nextContractId
        }
    }
    
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
    
    //To give the new User a id
    static func getNewUserId() -> Int {
        nextUserId += 1
        return nextUserId
    }
    
    //To give the new company a id
    static func getNewComId() -> Int {
        nextComId += 1
        return nextComId
    }
    
    //To give the new contract a id 
    static func getNewContractId() -> Int {
        nextContractId += 1
        return nextContractId
    }

    // 8.   The function when user is creating or moditying an oppotunity or a follow
    //The client which user will select or have selected
    private static var selectedClient = ClientInfo.init()
    
    //The stage which user will select or have selected
    private static var selectedStage = -1
    
    //The product which user will select or have selected
    private static var selectedProduct = ProductInfo.init()
    
    //the selected oppotunity
    private static var selectedOppo = OppoInfo.init()
    
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
    
    //To set the selected oppotunity
    static func setSelectedOppo(_oppo : OppoInfo) {
        selectedOppo = _oppo
    }
    
    //To get the selected oppotunity
    static func getSelectedOppo() -> OppoInfo {
        return selectedOppo
    }
    
    static var haveSelectedOppo = false
    
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
    
    static var isSearchingOppoWithAClient = false
    
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
    
    //To tell whether the process happend while creating a client or not
    static var isCreatingFollowFromClient = false
    
    // 9.   The other function
    //To save all the data to my cloud
    static func saveAllToWeb() {
        MyCloud.saveData()
    }
    
    //To check whether the password and username matchs each other or not
    static func checkPassword(userName : String, password : String) -> Bool {
        for i in 0 ..< userList.count {
            let user = userList[i]
            if userName == user.getUserName() && password == user.getPassword() {
                setCurrentUser(user)
                setCurrentCom(user.getComId())
                return true
            }
        }
        return false
    }
    
    //To check whether the username that the user type is existed or not
    static func checkIsExist(userName : String) -> Bool {
        for i in 0 ..< userList.count {
            if userName == userList[i].getUserName() {
                return true
            }
        }
        return false
    }
    
    //To check whether the code of the company that user type is existed or not
    static func isCodeExist(code : String) -> Bool{
        for i in 0 ..< comList.count {
            if code == comList[i].getCode() {
                return true
            }
        }
        return false
    }
    
    //To init data after login
    static func initDataProcess(){
        DataReader.initProductList()
    }
    
    //To init the list of all the products
    static func initProductList(){
        let a = ProductInfo.init(_name: "德国Hape字母珠算架（3岁以上）")
        let b = ProductInfo.init(_name: "美国怀乐儿童早教益智音乐健身脚踏琴")
        a.appendImgNames("1_1")
        a.appendImgNames("1_2")
        a.appendImgNames("1_3")
        a.appendImgNames("1_4")
        a.appendImgNames("1_5")
        a.appendImgNames("1_7")
        a.appendImgNames("1_8")
        a.appendImgNames("1_9")
        a.appendImgNames("1_10")
        b.appendImgNames("2_1")
        b.appendImgNames("2_2")
        b.appendImgNames("2_3")
        b.appendImgNames("2_4")
        b.appendImgNames("2_5")
        b.appendImgNames("2_7")
        b.appendImgNames("2_8")
        b.appendImgNames("2_9")
        b.appendImgNames("2_10")
        b.appendImgNames("2_11")
        b.appendImgNames("2_12")
        productList.append(a)
        productList.append(b)
    }
}