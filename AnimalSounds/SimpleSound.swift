import Foundation
import AudioToolbox

class SimpleSound {
    
    private var soundID: SystemSoundID = 0 //this way of playing sound files is only suitable for sounds less than 30 seconds
    
    public init(named name: String) {
        if let soundURL = soundURL(forName: name) {
            let status: OSStatus = AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID) //as CFURL means I am automatically changing soundURL to CFURL. soundID is of data type SystemSoundID. & gives the function the permisson to change the value of argument.
            if status != noErr {
                print("Unable to create sound at URL: '\(name)'")
                soundID = 0
            }
        }
    }
    
    public func play() {
        if soundID != 0 {
            AudioServicesPlaySystemSound(soundID)
        }
    }
    
    private func soundURL(forName name: String) -> URL? {
        
        let fileExtensions: [String] = ["m4a", "wav", "mp3", "aac", "adts", "aif", "aiff", "aifc", "caf", "mp4"]
        
        for fileExtention in fileExtensions {
            if let soundURL = Bundle.main.url(forResource: name, withExtension: fileExtention) {
                return soundURL
            }
        }
        print("Unable to find sound file with name '\(name)'")
        return nil
    }
    
    deinit {
        if soundID != 0 {
            AudioServicesDisposeSystemSoundID(soundID)
        }
    }
}
