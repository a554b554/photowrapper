//
//  resultViewController.swift
//  AVCam Swift
//
//  Created by chang xiao on 11/8/16.
//  Copyright © 2016 Apple, Inc. All rights reserved.
//


import UIKit

class cropViewController: UIViewController,UIAlertViewDelegate {
    
    var originalImage:UIImage?
    var imgView:UIImageView?

    var dragPs:[UIButton]?
    
//    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
//    [tapRecognizer setNumberOfTapsRequired:1];
//    [tapRecognizer setDelegate:self];
//    [self.view addGestureRecognizer:tapRecognizer];
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self.view)
        print("Location: \(location)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button   = UIButton(type: UIButtonType.contactAdd) as UIButton
//        button.isEnabled=false
        button.frame = CGRect(x:0, y:0, width:50, height:50)
        button.backgroundColor = UIColor.white
        //        button.setImage(image, forState: .Normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        self.view.bringSubview(toFront: button)

        let yoffset:CGFloat
        imgView = UIImageView(image: originalImage)
        let wratio:CGFloat = (originalImage?.size.height)!/(originalImage?.size.width)!
        let imgframeheight:CGFloat=self.view.frame.width*wratio
        yoffset=(self.view.frame.height-imgframeheight)/2.0
        
        
        imgView?.frame=CGRect(x: 0.0, y: yoffset, width: self.view.frame.width, height: imgframeheight)
        self.view.addSubview(imgView!)
        print(originalImage!.size.width)
        
        initDragButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("willappear")
     }
 
    
    func pressButton(button: UIButton) {
        print("pressed!")
    }
    //You can implement UIPanGestureRecognizer on your UIButton.
    //
    //Wherever you create your button (viewDidLoad if using outlets):
    //
    //let pan = UIPanGestureRecognizer(target: self, action: "panButton:")
    //button.addGestureRecognizer(pan)
    //This creates a new pan gesture recognizer and adds it to the button. Now, you'll want to implement the pan's action. First, you need to store the center of the button to be able to reset it when you finish panning. Add this as a view controller property:
    //
    //var buttonCenter = CGPointZero
    //Then you implement the pan action. Note that you can use gesture recognizer states to determine when the pan starts and ends:
    //
    //func panButton(pan: UIPanGestureRecognizer) {
    //
    //    if pan.state == .Began {
    //        buttonCenter = button.center // store old button center
    //    } else if pan.state == .Ended || pan.state == .Failed || pan.state == .Cancelled {
    //        button.center = buttonCenter // restore button center
    //    } else {
    //        let location = pan.locationInView(view) // get pan location
    //        button.center = location // set button to where finger is
    //    }
    //    
    //}
    


    func wasDragged (buttn : UIButton, event :UIEvent)
    {
        print("wasdragged")
        let touch : UITouch = event.touches(for:buttn)!.first!
        let previousLocation : CGPoint = touch.previousLocation(in: buttn)
        let location : CGPoint = touch .location(in: buttn)
        let delta_x :CGFloat = location.x - previousLocation.x
        let delta_y :CGFloat = location.y - previousLocation.y
        buttn.center = CGPoint(x:buttn.center.x+delta_x, y:buttn.center.y+delta_y);
        
    }
    

    
    func initDragButton(){
//        for i in 0..<4 {
//            print(i)
            let dragP1=UIButton(type: UIButtonType.contactAdd);
//            dragP1.center=self.view.center
            dragP1.frame=CGRect(x: 50, y: 50, width: 48, height: 48);
            dragP1.backgroundColor=UIColor(colorLiteralRed: 0, green: 0, blue: 1, alpha: 0.7)
            
            self.view.addSubview(dragP1)
            print(dragP1.center)
            dragP1.addTarget(self, action: Selector(("wasDragged:event:")), for: UIControlEvents.touchUpOutside)
        

//        dragPs?.append(button)
        
//            dragP1.layer.cornerRadius = 0.5 * dragP1.bounds.size.width // add the round corners in proportion to the button size
//            dragP1.clipsToBounds = true
//            let pan = UIPanGestureRecognizer(target: self, action: "dragButton:")
//            dragP1.addGestureRecognizer(pan)
//            func dragButton(pan: UIPanGestureRecognizer){
//                print("drag!!")
//                let location = pan.location(in: view)
//                dragP1.center=location
//                
//            }
            
//            let blur = UIVisualEffectView(effect: UIBlurEffect(style:
//                UIBlurEffectStyle.light))
//            blur.frame = dragP1.bounds
//            blur.isUserInteractionEnabled = false //This allows touches to forward to the button.
//            dragP1.insertSubview(blur, at: 0)
//        }

    }
    
    func ratingButtonTapped(_ button: UIButton) {
        print("Button pressed 👍")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    var bgImage: UIImageView?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        var image: UIImage = UIImage(named: "afternoon")!
//        bgImage = UIImageView(image: image)
//        bgImage!.frame = CGRectMake(0,0,100,200)
//        self.view.addSubview(bgImage!)
//    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
