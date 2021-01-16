//
//  ViewController.swift
//  Xylophone
//
//  Created by Aryan Shrivastava on 16/01/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        playSound(for: sender.currentTitle!)
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            sender.alpha = 1
            timer.invalidate()
        }
    }
    
    func playSound(for title: String){
        let url = Bundle.main.url(forResource: title, withExtension: "wav")
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        }catch{
            fatalError("Error in playing Sound: \(error.localizedDescription)")
        }
    }
}

