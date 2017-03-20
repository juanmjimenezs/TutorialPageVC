//
//  TutorialPageViewController.swift
//  TutorialPageVC
//
//  Created by Juan Manuel Jimenez Sanchez on 19/03/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    
    var tutorialSteps: [TutorialStep] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstStep = TutorialStep(index: 0, title: "Discover", image: #imageLiteral(resourceName: "discover"), description: "Discover new friends and relevant information near you.")
        self.tutorialSteps.append(firstStep)
        
        let secondStep = TutorialStep(index: 1, title: "Share", image: #imageLiteral(resourceName: "share"), description: "Share your goals with friends and the community.")
        self.tutorialSteps.append(secondStep)

        let thirdStep = TutorialStep(index: 2, title: "Save money", image: #imageLiteral(resourceName: "earn"), description: "Save money by learning to manage personal finances.")
        self.tutorialSteps.append(thirdStep)
        
        //Repeat the last two lines if you want another page for the tutorial...
        
        self.dataSource = self
        
        if let startVC = self.getViewController(atIndex: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
    }

}

extension TutorialPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! TutorialContentViewController).tutorialStep.index
        index += 1
        
        return self.getViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! TutorialContentViewController).tutorialStep.index
        index -= 1
        
        return self.getViewController(atIndex: index)
    }
    
    ///It returns the view controller with tutorial data sent by parameter
    func getViewController(atIndex: Int) -> TutorialContentViewController? {
        
        //If atIndex doesn't have a valid value
        if atIndex == NSNotFound || atIndex < 0 || atIndex >= self.tutorialSteps.count {
            return nil
        }
        
        if let pageContentVC = storyboard?.instantiateViewController(withIdentifier: "TutorialContent") as? TutorialContentViewController {
            pageContentVC.tutorialStep = self.tutorialSteps[atIndex]
            pageContentVC.totalPages = self.tutorialSteps.count
            
            return pageContentVC
        }
        
        return nil
    }
}
