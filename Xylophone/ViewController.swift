//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("Start")
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            sender.alpha = 1.0
            print("End")
        }
        
        playSound(file: sender.currentTitle ?? "")
    }
    
    func playSound(file: String) {
        guard let file = Bundle.main.url(forResource: file, withExtension: "wav") else { return }
        
        player = try! AVAudioPlayer(contentsOf: file)
        player?.play()
    }

}

