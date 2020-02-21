//
//  ALBusSeat-Ext.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 20.02.2020.
//

import UIKit

extension UIView {
    var topCenter: CGPoint {
        let x = frame.width / 2
        return CGPoint(x: x, y: 0)
    }
}

extension UIImage {
    static func bundleImage(named: String) -> UIImage? {
        let bundle = Bundle(for: self)
        return UIImage(named: named, in: bundle, compatibleWith: nil)
    }
}

extension UIImage {
    convenience init?(podAssetName: String) {
        let podBundle = Bundle(for: ALBusSeatView.self)
        
        /// A given class within your Pod framework
        guard let url = podBundle.url(forResource: "ALBusSeatView",
                                      withExtension: "bundle") else {
                                        return nil
                                        
        }
        
        self.init(named: podAssetName,
                  in: Bundle(url: url),
                  compatibleWith: nil)
    }
}
