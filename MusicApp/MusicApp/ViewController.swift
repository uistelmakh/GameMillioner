//
//  ViewController.swift
//  MusicApp
//
//  Created by днс on 13.01.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //labels
    @IBOutlet weak var nameMusicLabel: UILabel!
    
    
    //images
    @IBOutlet weak var imageForMusic: UIImageView!
    @IBOutlet weak var volumeMinImage: UIImageView!
    @IBOutlet weak var volumeMaxImage: UIImageView!
    
    //button labels
    @IBOutlet weak var leftOutletButton: UIButton!
    @IBOutlet weak var rightOutletButton: UIButton!
    @IBOutlet weak var playStopOutletButton: UIButton!
    
    //sliders
    
    @IBOutlet weak var musicSliderTime: UISlider!
    
    
    @IBOutlet weak var musicSliderVolume: UISlider!
    
    // player
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameMusicLabel.text = "Макс Корж - Горы по колено"
        
        imageForMusic.image = UIImage(named: "muz.png")
        imageForMusic.contentMode = .scaleToFill
        imageForMusic.layer.masksToBounds = true
        imageForMusic.layer.cornerRadius = 20
        
        volumeMinImage.image = UIImage(named: "sound-control.png")
        volumeMinImage.contentMode = .scaleToFill
        
        volumeMaxImage.image = UIImage(named: "volume-up.png")
        volumeMaxImage.contentMode = .scaleToFill
        
        musicSliderTime.minimumValue = 0.0
        musicSliderTime.maximumValue = 100.0
        musicSliderTime.value = 0.0
        
        do {
            if let audioPath = Bundle.main.path(forResource: "Макс Корж - Горы по колено", ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                musicSliderTime.maximumValue = Float(player.duration)
            }
        } catch  {
            print("")
        }
        player.stop()
        playStopOutletButton.setImage(UIImage(named: "play-2.png"), for: .normal)
        leftOutletButton.setImage(UIImage(named: "previous.png"), for: .normal)
        rightOutletButton.setImage(UIImage(named: "next.png"), for: .normal)
        
        musicSliderTime.addTarget(self, action: #selector(change(sender:)), for: .valueChanged)
        
        var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateSlider() {
        musicSliderTime.value = Float(player.currentTime)
    }
    
    @objc func change(sender: UISlider) {
        if sender == musicSliderTime {
            player.currentTime = TimeInterval(sender.value)
            
        }
    }
    
    // action buttons

    @IBAction func leftActionButton(_ sender: Any) {
    }
    @IBAction func rightActionButton(_ sender: Any) {
    }
    @IBAction func playStopActionButton(_ sender: Any) {
        if player.isPlaying {
            player.stop()
            
            playStopOutletButton.setImage(UIImage(named: "play-2.png"), for: .normal)
        } else {
            player.play()
            playStopOutletButton.setImage(UIImage(named: "pause-2.png"), for: .normal)
            
        }
    }
    @IBAction func sliderVolumeAction(_ sender: Any) {
        player.volume = self.musicSliderVolume.value
    }
    
}

