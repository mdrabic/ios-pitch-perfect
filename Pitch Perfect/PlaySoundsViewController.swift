//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Mike on 12/24/15.
//  Copyright © 2015 Mike. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    var receivedAudio:RecordedAudio!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }
    
    @IBAction func playSlow(sender: UIButton) {
        play(0.5)
    }

    @IBAction func playFast(sender: UIButton) {
        play(1.5)
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        play(pitch: 1000)
    }
    
    @IBAction func playDarkVader(sender: UIButton) {
        play(pitch: -1000)
    }
    
    @IBAction func stopPlayback(sender: UIButton) {
        stopPlayback()
    }
    
    func stopPlayback() {
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func play(speed: Float = 1.0, pitch: Float = 1.0){
        stopPlayback()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let pitchRateEffect = AVAudioUnitTimePitch()
        pitchRateEffect.pitch = pitch
        pitchRateEffect.rate = speed
        audioEngine.attachNode(pitchRateEffect)
        
        audioEngine.connect(audioPlayerNode, to: pitchRateEffect, format: nil)
        audioEngine.connect(pitchRateEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }

}
