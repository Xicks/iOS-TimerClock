//
//  ViewController.swift
//  TimerClock
//
//  Created by Leonardo Schick on 1/11/16.
//  Copyright © 2016 Xicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    var timer = NSTimer()
    var seconds_miliseconds : Double = 0.0
    var minutes: Int = 0
    var hours: Int = 0
    var isPaused : Bool = true
    
    @IBAction func startTimer(sender: AnyObject) {
        if isPaused {
            timer = NSTimer.scheduledTimerWithTimeInterval(0, target: self, selector: "count", userInfo: nil, repeats: true)
            isPaused = false
        }
    }
    
    @IBAction func pauseTimer(sender: AnyObject) {
        if isPaused == false {
            print("pausar")
            timer.invalidate()
            isPaused = true
        }
    }
    
    func count(){
        seconds_miliseconds += 0.01
        if seconds_miliseconds == 60.0 {
            seconds_miliseconds = 0
            minutes++
        }
        if minutes == 60 {
            minutes = 0
            hours++
            hoursLabel.text = "Hours: \(hours)"
        }
        timerLabel.text = "\(minutes):\(String(format: "%.2f", seconds_miliseconds))"
    }
    
    @IBAction func stopTimer(sender: AnyObject) {
        if isPaused == false {
            timer.invalidate()
            isPaused = true
        }
        seconds_miliseconds = 0.0
        minutes = 0
        timerLabel.text = "0:0.00"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

