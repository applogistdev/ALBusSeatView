//
//  ALBusSeat-Ext.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 20.02.2020.
//

import UIKit

extension UIView {
    
    /// Return top center position
    var topCenter: CGPoint {
        let x = frame.width / 2
        return CGPoint(x: x, y: 0)
    }
}

extension UIImage {
    
    /// Init image asset with name
    /// - Parameter podAssetName: Image name
    convenience init?(podAssetName: String) {
        let podBundle = Bundle(for: ALBusSeatView.self)
        /// A given class within your Pod framework
        guard let url = podBundle.url(forResource: "ALBusSeatView", withExtension: "bundle") else {
            return nil
        }
        self.init(named: podAssetName, in: Bundle(url: url), compatibleWith: nil)
    }
}
