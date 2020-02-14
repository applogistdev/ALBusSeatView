//
//  ALLeftHandDriveLayout.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 14.02.2020.
//

import UIKit

public class ALBusLeftHandDriveLayout: UICollectionViewFlowLayout {
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        let maxY = attributes?.map { $0.frame.origin.y }.max() ?? 0
        attributes?.forEach { layoutAttribute in
            
            let copyAttr = layoutAttribute.copy() as! UICollectionViewLayoutAttributes
            
            if copyAttr.representedElementCategory == .cell {
                copyAttr.frame.origin.y = abs(copyAttr.frame.origin.y - maxY)
            }
            
            attributesCopy.append(copyAttr)
        }
        return attributesCopy
    }
}
