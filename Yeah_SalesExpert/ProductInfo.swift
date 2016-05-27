//
//  ProductInfo.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/17.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class ProductInfo {
    
    private var name : String = ""
    private var imgNames = [String]()
    private var comId = -1
    private var id = 0
    
    init(){
        //do nothing
    }
    
    init(_name : String) {
        name = _name
        id = DataReader.getNewProductId()
    }
    
    func setName(_name : String) {
        name = _name
    }
    
    func getName() -> String {
        return name
    }
    
    func appendImgNames(_newName : String){
        imgNames.append(_newName)
    }
    
    func getImgNames() -> [String] {
        return imgNames
    }
    
    func getId() -> Int{
        return id
    }
    
    func setComId(_id : Int) {
        comId = _id
    }
    
    func getComId() -> Int {
        return comId
    }
}