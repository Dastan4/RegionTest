//
//  NavigationController.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 6/10/22.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hexString: "#FF8800")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = appearance
    }
}
