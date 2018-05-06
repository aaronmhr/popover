//
//  popVC.swift
//  poppy
//
//  Created by HUANUCO RAMOS Aaron Miguel on 3/5/18.
//  Copyright © 2018 HUANUCO RAMOS Aaron Miguel. All rights reserved.
//

import UIKit

protocol ButtonDidDisappearDelegate: class {
    func configureAndPresentPopover(from sender: UIButton)
    func buttonDisappear()
    func repositionPopover()
}

class PopVC: UIViewController {

    weak var popOverDelegate: ButtonDidDisappearDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBOutlet weak var popoverButton: UIButton!
    
    @IBAction func popoverAction(_ sender: Any) {
        popOverDelegate?.buttonDisappear()
        DispatchQueue.main.async {
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func reposition(_ sender: Any) {
        popOverDelegate?.repositionPopover()
    }
    

}
