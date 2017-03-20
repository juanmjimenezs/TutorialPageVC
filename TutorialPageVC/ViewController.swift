//
//  ViewController.swift
//  TutorialPageVC
//
//  Created by Juan Manuel Jimenez Sanchez on 19/03/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        let tutorialHasBeenSeen = defaults.bool(forKey: "tutorialHasBeenSeen")
        
        //if user has not seen the tutorial...
        if !tutorialHasBeenSeen {
            if let tutorialPageVC = storyboard?.instantiateViewController(withIdentifier: "TutorialContainer") as? TutorialPageViewController {
                self.present(tutorialPageVC, animated: true, completion: nil)
            }
        }
    }
}

