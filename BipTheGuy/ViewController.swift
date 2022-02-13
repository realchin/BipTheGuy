//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Timothy Chin on 2/13/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("🤬 ERROR: \(error.localizedDescription) Could not initialize AvAudioPlayer object")
            }
        } else {
            print("🤬 ERROR: Could not read data from file sound0")
        }
    }

    @IBAction func punchButtonPressed(_ sender: UIButton) {
        let originalFrame = sender.frame // original button frame
        let widthShrink: CGFloat = 30
        let heightShrink: CGFloat = 10
        let smallerFrame = CGRect(x: sender.frame.origin.x + widthShrink, y: sender.frame.origin.y + heightShrink, width: sender.frame.width - (2 * widthShrink), height: sender.frame.height - (2 * heightShrink))
        
        sender.frame = smallerFrame // shrink before we animate
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0) {
            sender.frame = originalFrame
        }
        
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect(x: imageView.frame.origin.x + imageWidthShrink, y: imageView.frame.origin.y + imageHeightShrink, width: imageView.frame.width - (imageWidthShrink * 2), height: imageView.frame.height - (imageHeightShrink * 2))
        
        imageView.frame = smallerImageFrame
        
        playSound(name: "punchSound")
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0) {
            self.imageView.frame = originalImageFrame
        }
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect(x: imageView.frame.origin.x + imageWidthShrink, y: imageView.frame.origin.y + imageHeightShrink, width: imageView.frame.width - (imageWidthShrink * 2), height: imageView.frame.height - (imageHeightShrink * 2))
        
        imageView.frame = smallerImageFrame
        
        playSound(name: "punchSound")
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0) {
            self.imageView.frame = originalImageFrame
        }
        
    }
}

