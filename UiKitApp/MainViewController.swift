//
//  MainViewController.swift
//  UiKitApp
//
//  Created by Руслан Арыстанов on 03.11.2024.
//

import UIKit

protocol MainDelegate {
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class MainViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {
            return
        }
        
        colorVC.mainDelegate = self
    }
}

extension MainViewController: MainDelegate {
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        mainView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
