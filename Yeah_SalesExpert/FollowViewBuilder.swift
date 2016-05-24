//
//  FollowViewBuilder.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/21.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import Foundation

class FollowViewBuilder {
    
    var view = UIView.init()
    var textView = UITextView.init()
    var label = UILabel.init()
    
    static var currentY : CGFloat = 525 * UIScreen.mainScreen().bounds.size.height / 667
    
    init(){
        FollowViewBuilder.currentY = 565 * UIScreen.mainScreen().bounds.size.height / 667
    }
    
    func getView(check : Check) -> UIView {
        //type 0 stands for oppotunity
        //type 1 stands for client
        
        view = UIView.init()
        textView = UITextView.init()
        label = UILabel.init()
        
        view.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.95)
        view.addSubview(textView)
        
        let context = check.getContext()
        let appendHeight : CGFloat  = CGFloat(context.characters.count) / 24 * 5
        
        let v_w : CGFloat  = 345 * transX
        let v_h : CGFloat = 125 * transY + appendHeight
        let blank : CGFloat = 20 * transX
        let v_x : CGFloat = 15 * transX
        let v_y = FollowViewBuilder.currentY
        let _x = blank, _y = blank, _w = v_w - blank * 2, _h = v_h - blank * 3
        
        textView.frame = CGRect.init(x: _x, y: _y, width: _w, height: _h)
        textView.text = context
        textView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        textView.editable = false
        
        view.frame = CGRect.init(x: v_x, y: v_y, width: v_w, height: v_h)
        
        label.frame = CGRect.init(x: _x, y: _y + _h, width: _w, height: v_h - _h - _y)
        label.text = "\(check.getDate().getYear())年 \(check.getDate().getMonth())月 \(check.getDate().getDay())日"
        label.textAlignment = NSTextAlignment.Right
        label.font = UIFont.init(name: (label.font?.fontName)!, size: (textView.font?.pointSize)!)
        view.addSubview(label)
        
        FollowViewBuilder.currentY += v_h + blank
        
        return view
    }
    
    let transX = UIScreen.mainScreen().bounds.size.width / 375
    let transY = UIScreen.mainScreen().bounds.size.height / 667
    
}