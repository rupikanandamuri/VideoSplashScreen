//
//  ViewController.swift
//  addVideoToLaunchScreen
//
//  Created by Rupika Sompalli on 27/11/18.
//  Copyright © 2018 Rupika. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let theURL = Bundle.main.url(forResource:"intro", withExtension: "mp4")
        //avPlayer = AVPlayer(url: theURL!) - Initialises the av player class with a URL object.
        
        avPlayer = AVPlayer(url: theURL!)
        
        //avPlayerLayer = AVPlayerLayer(player: avPlayer) - creating a layer to play the vide, every uielement has a layer, here the video will be played in this layer , you create a layer, and you give it the avPLayer object you created.
        
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        
        //how the video should be shown, should it play its origina size, or should it play with content being expanded, similar to aspect fit on image view
        
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        //The action to perform when the current player item has finished playing. You have given none, so it does nothing
        
        avPlayer.actionAtItemEnd = .none
        
        // you are making the player frame same as the view frame, so it coers the whole view,you have to set the frame value to the player.
        
        avPlayerLayer.frame = view.layer.bounds
        
        view.backgroundColor = .clear
        
        // you insert the created player layer into the view.
        
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
    
    }
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:Bundle.main)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "next") as! NextViewController
            self.present(nextViewController, animated:true, completion:nil)
        })
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
        
        
    }
   
}

