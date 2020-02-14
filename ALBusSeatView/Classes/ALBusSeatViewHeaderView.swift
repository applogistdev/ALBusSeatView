//
//  ALSeatViewHeaderView.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 14.02.2020.
//

import UIKit

class ALBusSeatViewHeaderView: UICollectionReusableView {
    
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    private func commonInit() {
        addSubview(imageView)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
