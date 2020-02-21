//
//  ALSeatCell.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 14.02.2020.
//

import UIKit


/// Bus SeatView UICollectionViewCell
public class ALBusSeatCell: UICollectionViewCell {
    
    var type: ALBusSeatType = .none
    
    var title: String = "" {
        didSet {
            label.text = title
        }
    }
    
    lazy var coverView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var removeImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.isHidden = true
        return imgView
    }()
    
    private(set) lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    /// Initializes and returns a newly allocated view object with the specified frame rectangle.
    /// - Parameter frame: Frame of Seat
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(coverView)
        coverView.addSubview(label)
        addSubview(removeImageView)
        bringSubviewToFront(removeImageView)
    }
    
    
    /// Lays out subviews
    public override func layoutSubviews() {
        super.layoutSubviews()
        coverView.frame = CGRect(x: 3, y: 3, width: bounds.width-6, height: bounds.height-6)
        label.frame = coverView.bounds
        removeImageView.frame = CGRect(x: coverView.frame.width-8, y: 0, width: 15, height: 15)
    }
    
    
    /// Use to clean up view for reuse
    public override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        isUserInteractionEnabled = true
        label.text = ""
        coverView.isHidden = false
        removeImageView.isHidden = true
    }
}
