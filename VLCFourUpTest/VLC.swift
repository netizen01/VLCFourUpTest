//
//  VLC.swift
//  VLCFourUpTest
//

import Foundation
import AppKit

class VLCLibrary {
    
    static private let PluginPath = "/Users/\( INSERT PATH TO THIS FOLDER HERE )/VLCFourUpTest/VLC/plugins"
    
    let libvlc: OpaquePointer
    
    init() {
        let options:[String] = [
            "--no-color",
            "--play-and-pause",
            "--no-video-title-show",
            "--verbose=0",
            "--no-sout-keep",
            "--vout=macosx",
            "--text-renderer=freetype"
        ]
        
        setenv("VLC_PLUGIN_PATH", VLCLibrary.PluginPath, 1)
        
        let cStrings = options.map { strdup($0) }
        libvlc = libvlc_new(Int32(options.count), cStrings.map { UnsafePointer<Int8>($0)} + [nil])
        cStrings.forEach { free($0) }
        
        print("VLC Lib Initialized: \(libvlc)")
    }
    
}


class VLCMediaPlayer {
    
    private let queue = DispatchQueue(label: "VLCMediaPlayer")
    
    let mediaPlayer: OpaquePointer
    let library: VLCLibrary
    
    init(_ library: VLCLibrary? = nil) {
        self.library = library ?? VLCLibrary()
        mediaPlayer = libvlc_media_player_new(self.library.libvlc)
    }
    
    var view: NSView? {
        didSet {
            if let view = view {
                let pointer = Unmanaged.passUnretained(view).toOpaque()
                libvlc_media_player_set_nsobject(self.mediaPlayer, pointer)
            }
        }
    }
    
    var media: VLCMedia? {
        didSet {
            queue.async {
                libvlc_media_player_set_media(self.mediaPlayer, self.media?.location)
            }
        }
    }
    func play() {
        queue.async {
            libvlc_media_player_play(self.mediaPlayer)
        }
    }
}


class VLCMedia {
    
    let location: OpaquePointer
    init(library: VLCLibrary, url: URL) {
        location = libvlc_media_new_location(library.libvlc, url.absoluteString);
    }
    
}


