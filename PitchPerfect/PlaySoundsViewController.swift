//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Marco Guevara on 10/29/22.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonImagesAspectFit()
        
        setupAudio()
    }
    
    private func setButtonImagesAspectFit(){
        slowButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        fastButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        lowPitchButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        highPitchButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        echoButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        reverbButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }

}
