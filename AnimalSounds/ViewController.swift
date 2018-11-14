//
//  ViewController.swift
//  AnimalSounds
//
//  Created by James Chun on 11/7/18.
//  Copyright © 2018 James Chun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animalSoundLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let animals: [Animal] = [
        Animal(emoji: "🐱", exclamation: "Meow!", simpleSound: SimpleSound(named: "meow")),
        Animal(emoji: "🐶", exclamation: "Woof!", simpleSound: SimpleSound(named: "woof")),
        Animal(emoji: "🐮", exclamation: "Moo!",  simpleSound: SimpleSound(named: "moo"))
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Change the font size of the segmented control to 72.
        let font: UIFont = UIFont.systemFont(ofSize: 72);
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]; //a dictionary
        segmentedControl!.setTitleTextAttributes(attributes, for: UIControl.State.normal);
        
        //Put the animals into the segmented control.
        segmentedControl!.removeAllSegments();
        for animal in animals {
            segmentedControl!.insertSegment(withTitle: animal.emoji, at: animals.count, animated: false);
        }
        
        //When the app is launched, no segment is selected yet.
        segmentedControl!.selectedSegmentIndex = -1;
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        let i: Int = segmentedControl!.selectedSegmentIndex; //Find out which segment was pressed.
        let animal: Animal = animals[i];
        animalSoundLabel.text = animal.exclamation;
        animal.simpleSound.play();
    }
    
}

