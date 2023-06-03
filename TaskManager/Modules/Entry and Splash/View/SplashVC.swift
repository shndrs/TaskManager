//
//  SplashVC.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit

final class SplashVC: BaseViewController {

    @IBOutlet private weak var lblTitle: LabelBold!
    @IBOutlet private weak var lblSubtitle: LabelLight!
    @IBOutlet private weak var imgSahand: ProfileImage! {
        didSet {
            imgSahand.image = Images.sahand
        }
    }
    
}

// MARK: - Methods

fileprivate extension SplashVC {
    
    func animationToggle() {
        lblTitle.fade(duration: 0.4, delay: 0)
        lblSubtitle.fade(duration: 0.4, delay: 0.4)
        imgSahand.fade(duration: 0.4, delay: 0.8)
    }
    
    func startRouting() {
        
    }
    
}

// MARK: - Life Cycle

extension SplashVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationToggle()
    }
    
}
