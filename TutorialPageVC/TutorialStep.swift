//
//  TutorialStep.swift
//  TutorialPageVC
//
//  Created by Juan Manuel Jimenez Sanchez on 19/03/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import Foundation
import UIKit

class TutorialStep {
    
    var index = 0//This is to know the page order
    var title = ""
    var image: UIImage!
    var description = ""
    
    init(index: Int, title: String, image: UIImage, description: String) {
        self.index = index
        self.title = title
        self.image = image
        self.description = description
    }
}
