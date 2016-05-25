//
//  MyCloud.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/23.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class MyCloud {

    static func initConnection(){
        let _appId = "SQjRufL6lSJR5Rc5g51rn1Rw-gzGzoHsz"
        let _clientKey = "XNfIrk0lItdQFWt2DAQ8yQ57"
        AVOSCloud.setApplicationId(_appId, clientKey : _clientKey)
        //saveData()
        updateURLS()
    }
    
    static var url_ClientList = "a", url_Contact = "b", url_ID = "c", url_Oppo = "d", url_user = "e", url_com = "f"
    
    static func saveURLSToCloud() {
        let urlList = AVObject.init(className: "URLS")
        urlList.setObject(url_ClientList, forKey: "url_ClientList")
        urlList.setObject(url_Contact, forKey: "url_Contact")
        urlList.setObject(url_ID, forKey: "url_ID")
        urlList.setObject(url_Oppo, forKey: "url_Oppo")
        urlList.setObject(url_user, forKey: "url_user")
        urlList.setObject(url_com, forKey: "url_com")
        urlList.saveInBackground()
    }
    
    static func updateURLS2() {
        let urlQuery = AVQuery.init(className: "URLS")
        let urlList = urlQuery.getObjectWithId("5745b6672e958a002da87dda")
        urlList.setObject(url_ClientList, forKey: "url_ClientList")
        urlList.setObject(url_Contact, forKey: "url_Contact")
        urlList.setObject(url_ID, forKey: "url_ID")
        urlList.setObject(url_Oppo, forKey: "url_Oppo")
        urlList.setObject(url_user, forKey: "url_user")
        urlList.setObject(url_com, forKey: "url_com")
        urlList.saveInBackgroundWithBlock { (flag : Bool, error : NSError!) in
            isSaveFinish = true
            readFromInternet()
        }
    }
    
    //getURLSFromCloud
    static func updateURLS() {
        if isSaveFinish == true {
        let urlQuery = AVQuery.init(className: "URLS")
        urlQuery.getObjectInBackgroundWithId("5745b6672e958a002da87dda", block: { (urlList : AVObject!, error : NSError!) in
            url_ClientList = urlList.objectForKey("url_ClientList") as! String
            url_Contact = urlList.objectForKey("url_Contact") as! String
            url_ID = urlList.objectForKey("url_ID") as! String
            url_Oppo = urlList.objectForKey("url_Oppo") as! String
            url_user = urlList.objectForKey("url_user") as! String
            url_com = urlList.objectForKey("url_com") as! String
            readFromInternet()
            })
        }
    }
    
//    static func saveURLS(){
//        var saveString = ""
//        saveString += url_ClientList + ";"
//        saveString += url_Contact + ";"
//        saveString += url_ID + ";"
//        saveString += url_Oppo + ";"
//        saveString += url_user + ";"
//        saveString += url_com + ";"
//         let filePath : String = documentPath.stringByAppendingPathComponent("urls")
//        do {
//            try saveString.writeToFile(filePath, atomically: true, encoding: _encoding)
//        } catch {
//            print("IO ERROR")
//        }
//    }
//    
//    static func getURLS() {
//        do {
//            let filePath : String = documentPath.stringByAppendingPathComponent("urls")
//            let savedString = try String.init(contentsOfFile: filePath, encoding: _encoding)
//            let str = savedString.characters.split(";")
//            url_ClientList = String(str[0])
//            url_Contact = String(str[1])
//            url_ID = String(str[2])
//            url_Oppo = String(str[3])
//            url_user = String(str[4])
//            url_com = String(str[5])
//        }catch{}
//    }
    
    static let sandboxPath : NSString = NSHomeDirectory()
    static let documentPath : NSString = sandboxPath.stringByAppendingPathComponent("Documents")
    static let _encoding = NSUTF8StringEncoding
    
    static func readFromInternet() {
        var _file = AVFile.init(URL: url_ClientList)
        var str = String.init(data: _file.getData(), encoding: _encoding)
        StringToDataForClientList(str!)
        
        _file = AVFile.init(URL: url_Contact)
        str = String.init(data: _file.getData(), encoding: _encoding)
        StringToDataForContactList(str!)
        
        _file = AVFile.init(URL: url_ID)
        str = String.init(data: _file.getData(), encoding: _encoding)
        StringToDataForIDs(str!)
        
        _file = AVFile.init(URL: url_Oppo)
        str = String.init(data: _file.getData(), encoding: _encoding)
        StringToDataForOppo(str!)
        
        _file = AVFile.init(URL: url_user)
        str = String.init(data: _file.getData(), encoding: _encoding)
        StringToDataForUserList(str!)
        
        _file = AVFile.init(URL: url_com)
        str = String.init(data: _file.getData(), encoding: _encoding)
        StringToDataForComList(str!)
    }
    
    static func saveData() {
        isSaveFinish = false
        let comList : String = dataToString(DataReader.getComList())
        saveCom(comList)
    }
    
    static func saveCom(str : String) {
        let comlist = AVFile.init(name: "ComInfo", data: str.dataUsingEncoding(_encoding))
        comlist.saveInBackgroundWithBlock { (succeed : Bool, error : NSError!) in
            url_com = comlist.url
            let userList : String = dataToString(DataReader.getUserList())
            saveUser(userList)
        }
    }
    
    static func saveUser(str : String){
        let userist = AVFile.init(name: "UserInfo", data: str.dataUsingEncoding(_encoding))
        userist.saveInBackgroundWithBlock { (succeed : Bool, error : NSError!) in
            url_user = userist.url
            let idList : String = dataToStringForIDs()
            saveIDs(idList)
        }
    }
    
    static var isSaveFinish = true
    
    static func saveIDs(str : String) {
        let idList = AVFile.init(name: "IDs", data: str.dataUsingEncoding(_encoding))
        idList.saveInBackgroundWithBlock { (succeed : Bool, error : NSError!) in
            url_ID = idList.url
            let contactlist : String = dataToString(DataReader.getContactList())
            saveContact(contactlist)
        }
    }
    
    static func saveContact(str : String) {
        let contactList = AVFile.init(name: "ContactInfo", data: str.dataUsingEncoding(_encoding))
        contactList.saveInBackgroundWithBlock { (succeed : Bool, error : NSError!) in
            url_Contact = contactList.url
            let clientList : String = dataToString(DataReader.getClientList())
            saveClient(clientList)
        }
    }
    
    static func saveClient(str : String) {
        let clientList = AVFile.init(name: "ClientInfo", data: str.dataUsingEncoding(_encoding))
        clientList.saveInBackgroundWithBlock { (succeed : Bool, error : NSError!) in
            url_ClientList = clientList.url
            let oppoList : String = dataToString(DataReader.getOppoList())
            saveOppo(oppoList)
        }
    }
    
    static func saveOppo(str : String) {
        let oppoList = AVFile.init(name: "OppoInfo", data: str.dataUsingEncoding(_encoding))
        oppoList.saveInBackgroundWithBlock { (succeed : Bool, error : NSError!) in
            url_Oppo = oppoList.url
            updateURLS2()
        }
    }
    
    static func StringToDataForComList(_string : String) {
        var comList = [CompanyInfo]()
        let comStr = _string.characters.split("|")
        for i in 0 ..< comStr.count {
            let com = CompanyInfo.init()
            let elementStr = String(comStr[i])
            let elements = elementStr.characters.split("`")
            com.setId(Int(String(elements[0]))!)
            com.setCode(String(elements[1]))
            com.setName(String(elements[2]))
            let userListStr = String(elements[3]).characters.split(";")
            for j in 0 ..< userListStr.count {
                com.appendUserList(Int(String(userListStr[j]))!)
            }
            comList.append(com)
        }
        DataReader.setComList(comList)
    }
    
    static func StringToDataForUserList(_string : String) {
        var userList = [UserInfo]()
        let userStr = _string.characters.split("|")
        for i in 0 ..< userStr.count {
            let user = UserInfo.init()
            let elementStr = String(userStr[i])
            let elements = elementStr.characters.split("`")
            user.setId(Int(String(elements[0]))!)
            user.setUserName(String(elements[1]))
            user.setPassword(String(elements[2]))
            user.setName(String(elements[3]))
            user.setComId(Int(String(elements[4]))!)
            userList.append(user)
        }
        DataReader.setUserList(userList)
    }
    
    static func StringToDataForContactList(_string : String){
        var contactList = [ContactInfo]()
        let contactString = _string.characters.split("|")
        for i in 0 ..< contactString.count {
            let contact = ContactInfo.init()
            let elementStr = String(contactString[i])
            let elements = elementStr.characters.split("`")
            contact.setId(Int(String(elements[0]))!)
            contact.setName(String(elements[1]))
            contact.setMobile(String(elements[2]))
            contact.setPhone(String(elements[3]))
            contact.setEmail(String(elements[4]))
            contact.setClientId(Int(String(elements[5]))!)
            contact.setUserId(Int(String(elements[6]))!)
            contactList.append(contact)
        }
        DataReader.setContactList(contactList)
    }
    
    static func StringToDataForClientList(_string : String){
        var clientList = [ClientInfo]()
        let clientString = _string.characters.split("|")
        for i in 0 ..< clientString.count {
            let client = ClientInfo.init()
            let elementStr = String(clientString[i])
            let elements = elementStr.characters.split("`")
            client.setId(Int(String(elements[0]))!)
            client.setName(String(elements[1]))
            client.setCompany(String(elements[2]))
            client.setJob(String(elements[3]))
            client.setMobile(String(elements[4]))
            client.setPhone(String(elements[5]))
            client.setEmail(String(elements[6]))
            client.setUserId(Int(String(elements[7]))!)
            client.setComId(Int(String(elements[8]))!)
            let checkStr = String(elements[9]).characters.split("\\")
            var checkList = [Check]()
            for j in 0 ..< checkStr.count {
                let check = Check.init()
                let checkInfoStr = String(checkStr[j]).characters.split(";")
                check.setUserId(Int(String(checkInfoStr[0]))!)
                check.setContext(String(checkInfoStr[1]))
                let _year = Int(String(checkInfoStr[2]))!
                let _month = Int(String(checkInfoStr[3]))!
                let _day = Int(String(checkInfoStr[4]))!
                check.setDate(_year, MM: _month, DD: _day)
                checkList.append(check)
            }
            client.setCheckList(checkList)
            clientList.append(client)
        }
        DataReader.setClientList(clientList)
    }
    
    static func StringToDataForIDs(_string : String) {
        let str = _string.characters.split("|")
        for i in 0 ..< 4 {
            DataReader.setNextId(i, value: Int(String(str[i]))!)
        }
    }
    
    static func dataToStringForIDs() -> String {
        var theString = ""
        theString += String(DataReader.getID(0)) + "|"
        theString += String(DataReader.getID(1)) + "|"
        theString += String(DataReader.getID(2)) + "|"
        theString += String(DataReader.getID(3)) + "|"
        return theString
        
    }
    
    static func StringToDataForOppo(_string : String){
        var oppoList = [OppoInfo]()
        let oppoString = _string.characters.split("|")
        for i in 0 ..< oppoString.count {
            let oppo = OppoInfo.init()
            let elementStr = String(oppoString[i])
            let elements = elementStr.characters.split("`")
            oppo.setId(Int(String(elements[0]))!)
            oppo.setName(String(elements[1]))
            oppo.setClientId(Int(String(elements[2]))!)
            oppo.setStage(Int(String(elements[3]))!)
            oppo.setTargetSales(Int(String(elements[4]))!)
            oppo.setProductId(Int(String(elements[5]))!)
            oppo.setUserId(Int(String(elements[7]))!)
            oppo.setComId(Int(String(elements[8]))!)
            let checkStr = String(elements[9]).characters.split("\\")
            var checkList = [Check]()
            for j in 0 ..< checkStr.count {
                let check = Check.init()
                let checkInfoStr = String(checkStr[j]).characters.split(";")
                check.setUserId(Int(String(checkInfoStr[0]))!)
                check.setContext(String(checkInfoStr[1]))
                let _year = Int(String(checkInfoStr[2]))!
                let _month = Int(String(checkInfoStr[3]))!
                let _day = Int(String(checkInfoStr[4]))!
                check.setDate(_year, MM: _month, DD: _day)
                checkList.append(check)
            }
            oppo.setCheckList(checkList)
            oppoList.append(oppo)
        }
        DataReader.setOppoList(oppoList)
    }
    
    static func dataToString(contactList : [ContactInfo]) -> String {
        var theString = ""
        for i in 0 ..< contactList.count {
            let contact = contactList[i]
            theString += "|"
            theString += String(contact.getId()) + "`"
            theString += String(contact.getName()) + "`"
            theString += String(contact.getMobile()) + "`"
            theString += String(contact.getPhone()) + "`"
            theString += String(contact.getEmail()) + "`"
            theString += String(contact.getClientId()) + "`"
            theString += String(contact.getUserId()) + "`"
        }
        return theString
    }
    
    static func dataToString(userList : [UserInfo]) -> String {
        var theString = ""
        for i in 0 ..< userList.count {
            theString += "|"
            let user = userList[i]
            theString += String(user.getId()) + "`"
            theString += String(user.getUserName()) + "`"
            theString += String(user.getPassword()) + "`"
            theString += String(user.getName()) + "`"
            theString += String(user.getComId()) + "`"
        }
        return theString
    }
    
    static func dataToString(comList : [CompanyInfo]) -> String {
        var theString = ""
        for i in 0 ..< comList.count {
            theString += "|"
            let com = comList[i]
            theString += String(com.getId()) + "`"
            theString += String(com.getCode()) + "`"
            theString += String(com.getName()) + "`"
            let ids = com.getUserList()
            for i in 0 ..< ids.count {
                theString += String(ids[i]) + ";"
            }
        }
        return theString
    }
    
    static func dataToString(oppoList : [OppoInfo]) -> String {
        var theString = ""
        for i in 0 ..< oppoList.count {
            theString += "|"
            let oppo = oppoList[i]
            theString += String(oppo.getId()) + "`"
            theString += String(oppo.getName()) + "`"
            theString += String(oppo.getClientId()) + "`"
            theString += String(oppo.getStage()) + "`"
            theString += String(oppo.getTargetSales()) + "`"
            theString += String(oppo.getProductId()) + "`"
            theString += String(oppo.isEndOrNot()) + "`"
            theString += String(oppo.getUserId()) + "`"
            theString += String(oppo.getComId()) + "`"
            let checkList = oppo.getCheckList()
            for j in 0 ..< checkList.count {
                theString += "\\" + String(checkList[j].getUserId()) + ";"
                theString += String(checkList[j].getContext()) + ";"
                theString += String(checkList[j].getDate().getYear()) + ";"
                theString += String(checkList[j].getDate().getMonth()) + ";"
                theString += String(checkList[j].getDate().getDay())
            }
        }
        return theString
    }
    
    static func dataToString(clientList : [ClientInfo]) -> String {
        var theString = ""
        for i in 0 ..< clientList.count {
            theString += "|"
            let client = clientList[i]
            theString += String(client.getId()) + "`"
            theString += String(client.getName()) + "`"
            theString += String(client.getCompany()) + "`"
            theString += String(client.getJob()) + "`"
            theString += String(client.getMobile()) + "`"
            theString += String(client.getPhone()) + "`"
            theString += String(client.getEmail()) + "`"
            theString += String(client.getUserId()) + "`"
            theString += String(client.getComId()) + "`"
            let checkList = client.getCheckList()
            for j in 0 ..< checkList.count {
                theString += "\\" + String(checkList[j].getUserId()) + ";"
                theString += String(checkList[j].getContext()) + ";"
                theString += String(checkList[j].getDate().getYear()) + ";"
                theString += String(checkList[j].getDate().getMonth()) + ";"
                theString += String(checkList[j].getDate().getDay())
            }
        }
        return theString
    }

}