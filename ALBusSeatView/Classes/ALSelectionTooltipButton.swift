//
//  ALSelectionTooltipButton.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 20.02.2020.
//

import UIKit

class ALSelectionTooltipButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            imageView?.alpha = isEnabled ? 1.0 : 0.5
        }
    }
}
