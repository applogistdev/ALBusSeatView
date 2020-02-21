//
//  ALLeftHandDriveLayout.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 14.02.2020.
//

import UIKit

/// Left hand drive layout 
public class ALBusLeftHandDriveLayout: UICollectionViewFlowLayout {
    
    /// Return Left Handed Custom Layout Attributes
    /// - Parameter rect: Elements Rect
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        let maxY = attributes?.map { $0.frame.origin.y }.max() ?? 0
        let maxH = attributes?.filter { $0.representedElementCategory == .cell }.map { $0.frame.height }.max() ?? 0
        attributes?.forEach { layoutAttribute in
            
            let copyAttr = layoutAttribute.copy() as! UICollectionViewLayoutAttributes
            
            if copyAttr.representedElementCategory == .cell {
                copyAttr.frame.origin.y  = abs(copyAttr.frame.origin.y - maxY) + (maxH - copyAttr.frame.height)
            }
            
            attributesCopy.append(copyAttr)
        }
        return attributesCopy
    }
}
