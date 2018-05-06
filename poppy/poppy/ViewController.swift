//
//  ViewController.swift
//  poppy
//
//  Created by HUANUCO RAMOS Aaron Miguel on 3/5/18.
//  Copyright © 2018 HUANUCO RAMOS Aaron Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ButtonDidDisappearDelegate {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    @IBOutlet weak var constrain2: NSLayoutConstraint!

    var popVC: PopVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPopover(_ sender: UIButton) {
        configureAndPresentPopover(from: sender)
    }

    func buttonDisappear() {
        self.constrain2.constant = 100
        self.button3.isHidden = !self.button3.isHidden

        if !self.button3.isHidden {
            self.constrain2.constant = 10
        }
    }

    func repositionPopover() {
        DispatchQueue.main.async {
            if let popVC = self.popVC {
                self.self.popoverPresentationController(popVC.popoverPresentationController!, willRepositionPopoverTo: self.button4.bounds, in: self.button4)
            }
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {

    func configureAndPresentPopover(from sender: UIButton) {

        popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") as? PopVC

        guard let popVC = popVC else {
            return
        }

        popVC.popOverDelegate = self
        popVC.modalPresentationStyle = .popover

        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = sender
        popOverVC?.sourceRect = sender.bounds
        popVC.preferredContentSize = CGSize(width: 300, height: 60)
        popOverVC?.permittedArrowDirections = .down

        self.present(popVC, animated: true)
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func popoverPresentationController(_ popoverPresentationController: UIPopoverPresentationController,
                                       willRepositionPopoverTo rect: CGRect,
                                       in view: UIView) {
        popoverPresentationController.sourceView = view
        popoverPresentationController.sourceRect = rect
    }
}

