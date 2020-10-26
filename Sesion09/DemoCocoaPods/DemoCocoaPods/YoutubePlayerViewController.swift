//
//  YoutubePlayerViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/26/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import YouTubePlayer_Swift

class YoutubePlayerViewController: UIViewController {

    @IBOutlet weak var youtubePlayer: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.youtubePlayer.loadVideoID("NEHp1gZTXHI")
    }
}
