//
//  ViewController.swift
//  VLCFourUpTest
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var view0: NSView!
    @IBOutlet var view1: NSView!
    @IBOutlet var view2: NSView!
    @IBOutlet var view3: NSView!
    
    let library = VLCLibrary()
    
    var player0: VLCMediaPlayer!
    var player1: VLCMediaPlayer!
    var player2: VLCMediaPlayer!
    var player3: VLCMediaPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a new libvlc library instance for each media player
        player0 = VLCMediaPlayer()
        player1 = VLCMediaPlayer()
        player2 = VLCMediaPlayer()
        player3 = VLCMediaPlayer()
        
        // Share a single libvlc library instance for each media player
//        player0 = VLCMediaPlayer(library)
//        player1 = VLCMediaPlayer(library)
//        player2 = VLCMediaPlayer(library)
//        player3 = VLCMediaPlayer(library)
        
        
        // Adjust RTMP / RTSP streams to be different
        player0.view = view0
        player0.media = VLCMedia(library: player0.library, url: URL(string: "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov")!)
        
        player1.view = view1
        player1.media = VLCMedia(library: player1.library, url: URL(string: "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov")!)
        
        player2.view = view2
        player2.media = VLCMedia(library: player2.library, url: URL(string: "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov")!)
        
        player3.view = view3
        player3.media = VLCMedia(library: player3.library, url: URL(string: "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov")!)
    }

    @IBAction func click0Handler(_ sender: Any) {
        print("click0Handler")
        player0.play()
    }
    
    @IBAction func click1Handler(_ sender: Any) {
        print("click1Handler")
        player1.play()
    }
    
    @IBAction func click2Handler(_ sender: Any) {
        print("click2Handler")
        player2.play()
    }
    
    @IBAction func click3Handler(_ sender: Any) {
        print("click3Handler")
        player3.play()
    }
}

