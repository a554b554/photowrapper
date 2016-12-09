//
//  resultViewController.swift
//  AVCam Swift
//
//  Created by chang xiao on 11/8/16.
//  Copyright © 2016 Apple, Inc. All rights reserved.
//

import UIKit

class resultViewController: UIViewController, UIAlertViewDelegate {

    var dataString:String?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded data \(dataString!)")
        let alert = UIAlertView(title: "Title", message: dataString!, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Confrim")
        
        alert.show()
        
        
        // Do any additional setup after loading the view.
        let webView = UIWebView(frame: view.frame)
        
        let url = NSURL (string: dataString!)
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest)
        
        view.addSubview(webView)
        view.bringSubview(toFront: webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
