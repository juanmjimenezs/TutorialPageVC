//
//  TutorialContentViewController.swift
//  TutorialPageVC
//
//  Created by Juan Manuel Jimenez Sanchez on 19/03/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class TutorialContentViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    
    var tutorialStep: TutorialStep!
    var totalPages: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblTitle.text = self.tutorialStep.title
        self.image.image = self.tutorialStep.image
        self.lblDescription.text = self.tutorialStep.description
        
        //Set the page control
        self.pageControl.numberOfPages = self.totalPages
        self.pageControl.currentPage = self.tutorialStep.index
        
        //Set the text of the button
        if (self.tutorialStep.index + 1) == self.totalPages {//Last page
            self.btnNext.setTitle("Close", for: .normal)
        } else {//All but the last page
            self.btnNext.setTitle("Next", for: .normal)
        }
    }

    @IBAction func btnNextPressed(_ sender: UIButton) {
        if (self.tutorialStep.index + 1) == self.totalPages {//Last page
            //Store: the user has seen the tutorial
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "tutorialHasBeenSeen")
            //Finalize the tutorial
            self.dismiss(animated: true, completion: nil)
        } else {//All but the last page
            //Get the Page View Controller
            let tutorialPageVC = parent as! TutorialPageViewController
            //And now we try to get the next page of the tutorial
            if let nextTutorialContentVC = tutorialPageVC.getViewController(atIndex: self.tutorialStep.index + 1) {
                tutorialPageVC.setViewControllers([nextTutorialContentVC], direction: .forward, animated: true, completion: nil)
            }
        }
    }
}
