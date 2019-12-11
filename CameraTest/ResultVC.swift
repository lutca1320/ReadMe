//
//  ResultVC.swift
//  CameraTest
//
//  Created by RUKA SPROUT on 2019/11/15.
//  Copyright © 2019 RUKA SPROUT. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation

var player: AVAudioPlayer!

class ResultVC: UIViewController, UINavigationControllerDelegate
{
    var isplaying: Bool = false
    @IBOutlet weak var playbutton: UIImageView!
    @IBOutlet weak var timelabel: UILabel!
    
    var audio_b64: String = String()
    var audiodata: Data = Data()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let TapG = UITapGestureRecognizer(target: self, action: #selector(PlayAudio))
        let UpG = UISwipeGestureRecognizer(target: self, action: #selector(GoFront))
        let DownG = UISwipeGestureRecognizer(target: self, action: #selector(GoDown))
        
        UpG.direction = .up
        DownG.direction = .down
        
        view.addGestureRecognizer(TapG)
        view.addGestureRecognizer(UpG)
        view.addGestureRecognizer(DownG)
        
        audiodata = Data(base64Encoded: audio_b64)!
    
        do {
            player = try AVAudioPlayer(data: audiodata)
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @objc func PlayAudio()
    {
        if isplaying
        {
            // Stop Audio
            playbutton.image = UIImage(systemName: "play")
            
            isplaying = false
        }
        else
        {
            // Play Audio
            playbutton.image = UIImage(systemName: "pause")
            
            player.play()
            
            isplaying = true
        }
    }
    
    @objc func GoFront()
    {
        // Go 10s Front
    }
    
    @objc func GoDown()
    {
        // Go 10s Backward
    }
    
    @IBAction func DebugDL(_ sender: UIButton)
    {
        // let audiodata = Data(base64Encoded: <#T##String#>)
    }
    
}
