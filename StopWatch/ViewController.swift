//
//  ViewController.swift
//  StopWatch
//
//  Created by Денис Лапшин on 13/03/2019.
//  Copyright © 2019 Денис Лапшин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    var stopWatchState = StopWatchState.stop
    var timer = Timer()
    var counter: Float = 0.000

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitle("Start", for: .normal)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.isEnabled = false
        clearButton.alpha = 0.5
    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        switch stopWatchState {
        case .stop:
            startButton.setTitle("Stop", for: .normal)
            stopWatchState = .start
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            clearButton.isEnabled = false
            clearButton.alpha = 0.5
        case .start:
            startButton.setTitle("Start", for: .normal)
            stopWatchState = .stop
            timer.invalidate()
            clearButton.isEnabled = true
            clearButton.alpha = 1.0
        }
    }
    
    @objc func updateTimer() {
        counter = counter + 0.001
        timeLabel.text = String(format: "%.03f", counter)
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        counter = 0.000
        timeLabel.text = String(format: "%.03f", counter)
    }
    

}

