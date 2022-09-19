//
//  ViewController.swift
//  1. Base
//
//  Created by Дмитрий on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet var labelText: UILabel!
    //@IBOutlet var sButton: UIButton!
    
    @IBOutlet var redTL: UIView!
    @IBOutlet var yellowTL: UIView!
    @IBOutlet var greenTL: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var staringTL = false
    private let delay = 1
    
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startPosition()
    }
    func startPosition(){
        redTL.alpha = lightOff
        yellowTL.alpha = lightOff
        greenTL.alpha = lightOff
    }
    
    override func viewWillLayoutSubviews() {
        let cornerRadius = redTL.frame.width / 2
        redTL.layer.cornerRadius = cornerRadius
        yellowTL.layer.cornerRadius = cornerRadius
        greenTL.layer.cornerRadius = cornerRadius
    }
    
    func workingTL(){
        if !staringTL {return}
        redTL.alpha = self.lightOn
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
            self.redTL.alpha = self.lightOff
            if !self.staringTL {return}
            self.yellowTL.alpha = self.lightOn
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(self.delay), execute: {
                self.yellowTL.alpha = self.lightOff
                if !self.staringTL {return}
                self.greenTL.alpha = self.lightOn
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(self.delay), execute: {
                    self.greenTL.alpha = self.lightOff
                    self.workingTL()
                })
            })
        })
        
    }
    @IBAction func pushStart() {
        if !staringTL {
            startButton.setTitle("STOP", for: .normal)
            staringTL.toggle()
            workingTL()
        }else{
            startButton.setTitle("START", for: .normal)
            startPosition()
            staringTL.toggle()
        }
        
        
    }
    
//    @IBAction func pushSButton() {
//        labelText.isHidden.toggle()
//        sButton.setTitle("Show Text", for: .normal)
//
//    }
    
}

