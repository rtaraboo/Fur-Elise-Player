//
//  ViewController.swift
//  Fur Elise Player
//
//  Created by Rosario Tarabocchia on 9/29/15.
//  Copyright © 2015 RLDT. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer = AVAudioPlayer()

    @IBOutlet weak var sldScrub: UISlider!
    @IBOutlet weak var sldVolume: UISlider!
    
    
    func updateSldScrub(){
    
    sldScrub.value = Float(player.currentTime)
    
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
        
        
        try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("fur_elise", ofType: "mp3")!))
            
            sldScrub.maximumValue = Float(player.duration)
            sldScrub.minimumValue = 0.0
            
        } catch {
        
        // Didnt work
        
        }
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateSldScrub"), userInfo: nil, repeats: true)
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPlayACTION(sender: AnyObject) {
        
        player.play()
    }

    @IBAction func sldVolumeACTION(sender: AnyObject) {
        
        player.volume = sldVolume.value
    }
    
    @IBAction func sldScrubACTION(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(sldScrub.value)
        
    }
    
    
    @IBAction func btnStop(sender: AnyObject) {
        
        player.pause()
        
        
        do {
            
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("fur_elise", ofType: "mp3")!))
            
        } catch {
            
            // Didnt work
            
        }
        
    }
    
    
    @IBAction func btnPause(sender: AnyObject) {
        
        player.pause()
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

