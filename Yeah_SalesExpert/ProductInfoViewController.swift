//
//  ProductInfoViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/17.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class ProductInfoViewController: UIViewController {

    private var product = ProductInfo.init()
    private var imgNames = [String]()
    private var imgCount = 0
    private var imageViews = [UIImageView]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transAll()
       // scrollView.frame = CGRect.init(x: 0 , y: 0, width: _w, height: 1000)
        product = DataReader.getCurrentProduct()
        initProductPic()
        
        // Do any additional setup after loading the view.
    }
    
    let _x : CGFloat = 0, _w : CGFloat = UIScreen.mainScreen().bounds.size.width
    var _y  : CGFloat = 0, _h : CGFloat = 0
    
    func initProductPic() {
        imgNames = product.getImgNames()
        imgCount = imgNames.count
        var imgName = ""
        //var imgView = UIImageView.init(frame: <#T##CGRect#>)
        
        for i in 0..<imgCount {
            imgName = imgNames[i]
            let _image = UIImage.init(named: imgName)
            let WdivideH = (_image?.size.width)! / (_image?.size.height)!
            _h = _w / WdivideH
            
            let imageView = UIImageView.init(image: _image)
            imageView.frame = CGRect.init(x: _x, y: _y, width: _w, height: _h)
            _y += _h
            
            scrollView.addSubview(imageView)
        }
     
        scrollView.contentSize = CGSize.init(width: _w, height: _y)
        //scrollView.scrollRectToVisible(CGRect.init(x: 0 , y: 0, width: _w, height: _y), animated: true)
        //scrollView.scrollEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = product.getName()
        self.tabBarController?.tabBar.hidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func transAll(){
        trans(scrollView)
    }
    
    
    //Turn one view and all its subviews into suitable size
    private func trans(temp : UIView){
        temp.frame = remakeFrame(temp.frame.origin.x, y: temp.frame.origin.y, width: temp.frame.size.width, height: temp.frame.size.height)
        
        if(temp.subviews.count != 0){
            for i in temp.subviews{
                trans(i)
            }
        }
    }
    
    let transX = UIScreen.mainScreen().bounds.size.width / 375
    let transY = UIScreen.mainScreen().bounds.size.height / 667
    
    
    //Turn one view into suitable size
    private func remakeFrame(x : CGFloat, y : CGFloat, width : CGFloat, height : CGFloat) -> CGRect{
        var rect = CGRect.init()
        if(rect.origin.x < 0){
            
        }else{
            rect.origin.x = x * transX
        }
        
        rect.origin.y = y * transY
        rect.size.width = width * transX
        rect.size.height = height * transY
        return rect
    }


}
