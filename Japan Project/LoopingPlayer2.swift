//
//  LoopingPlayer.swift
//  LoopingPlayer
//
//  Created by SchwiftyUI on 3/28/20.
//  Copyright © 2020 SchwiftyUI. All rights reserved.
//

import SwiftUI
import AVFoundation

struct LoopingPlayer2: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return QueuePlayerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Do nothing here
    }
}

class QueuePlayerUIView3: UIView {
    private var playerLayer2 = AVPlayerLayer()
    private var playerLooper2 : AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load Video
        let fileUrl2 = Bundle.main.url(forResource: "VideoWithBlock", withExtension: "mov")!
        let playerItem2 = AVPlayerItem(url: fileUrl2)
        
        // Setup Player
        let player2 = AVQueuePlayer(playerItem: playerItem2)
        playerLayer2.player = player2
        playerLayer2.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer2)
        
        // Loop
        playerLooper2 = AVPlayerLooper(player: player2, templateItem: playerItem2)
        
        // Play
        player2.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer2.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PlayerUIView2: UIView {
    private var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load Video
        let fileUrl2 = Bundle.main.url(forResource: "VideoWithBlock", withExtension: "mov")!
        let playerItem2 = AVPlayerItem(url: fileUrl2)
        
        // Setup Player
        let player2 = AVPlayer(playerItem: playerItem2)
        playerLayer.player = player2
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Loop
        player2.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player2.currentItem)
        
        // Play
        player2.play()
    }
    
    @objc
    func rewindVideo(notification: Notification) {
        playerLayer.player?.seek(to: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct LoopingPlayer_Previews2: PreviewProvider {
    static var previews: some View {
        LoopingPlayer2()
    }
}

