//
//  ALSelectionTooltip.swift
//  ALBusSeatView
//
//  Created by Soner Güler on 20.02.2020.
//

import UIKit


/// Bus SeatView User Selection Type
public enum ALSelectionType: String {
    /// Woman Selection
    case woman
    
    /// Man Selection
    case man
}

class ALSelectionTooltip: UIView {
    
    
    /// Triggered when user tap one of the selection and returns the selection type
    var selectionHandler: ((_ type: ALSelectionType) -> Void)?
    
    
    /// Returns the visibility status of tooltip
    var isVisible: Bool = false
    
    /// Disabled selection options. Either can be set before or later
    var disabledSelections = Set<ALSelectionType>() {
        didSet {
            self.handleDisabledButtons()
        }
    }
    
    var title: String = "" {
        didSet {
            infoLabel.text = title
        }
    }
    
    
    private lazy var bgImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.shadowColor = UIColor.gray.cgColor
        imgView.layer.shadowRadius = 7
        imgView.layer.shadowOpacity = 0.5
        imgView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imgView.image = UIImage(podAssetName: "iconTooltipBG")?.withRenderingMode(.automatic)
        return imgView
    }()
    
    private lazy var leftButton: UIButton = {
        let button = ALSelectionTooltipButton()
        button.tag = 0
        
        let img = UIImage(podAssetName: "iconWomanSelection")
        
        button.setBackgroundImage(img,
                                  for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(button:)),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = ALSelectionTooltipButton()
        button.tag = 1
        button.setBackgroundImage(UIImage(podAssetName: "iconManSelection"),
                                  for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(button:)),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.minimumScaleFactor = 0.5
        lbl.lineBreakMode = .byClipping
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    private var fromView: UIView?
    private let selfTag = 76637
    private let animateDuration = 0.2
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        tag = selfTag
        addSubview(bgImageView)
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(infoLabel)
        handleDisabledButtons()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImageView.frame = bounds
        
        let viewW = frame.width
        let viewH = frame.height * 0.89 // Height without bottom triangle
        let margin: CGFloat = 5.0
        let butW = viewH - (margin * 2)
        let labelW = viewW - (viewH * 2)
        
        leftButton.frame = CGRect(x: margin, y: margin,
                                  width: butW, height: butW)
        infoLabel.frame = CGRect(x: viewH, y: 0,
                                 width: labelW, height: viewH)
        rightButton.frame = CGRect(x: viewH + labelW + margin,
                                   y: margin, width: butW, height: butW)
    }
    
    @IBAction func buttonTapped(button: UIButton) {
        let type: ALSelectionType = button.tag == 0 ? .woman : .man
        selectionHandler?(type)
    }
    
    func handleDisabledButtons() {
        leftButton.isEnabled = !disabledSelections.contains(.woman)
        rightButton.isEnabled = !disabledSelections.contains(.man)
    }
    
    func show(from view: UIView, origin: CGPoint, animated: Bool = true) {
        fromView = view
        let coorY = origin.y - (frame.height / 2)
        center = CGPoint(x: origin.x, y: coorY)
        view.clipsToBounds = false
        
        if !animated {
            view.addSubview(self)
            self.isVisible = true
            return
        }
        
        self.alpha = 0.0
        view.addSubview(self)
        UIView.animate(withDuration: animateDuration, animations: {
            self.alpha = 1.0
            self.isVisible = true
        })
    }
    
    func hide(animated: Bool = true) {
        fromView?.subviews.forEach {
            if $0.tag == selfTag {
                let view = $0
                
                if !animated {
                    view.removeFromSuperview()
                    self.isVisible = false
                    return
                }
                
                UIView.animate(withDuration: animateDuration, animations: {
                    view.alpha = 0.0
                }, completion:  { (done) in
                    view.removeFromSuperview()
                    self.isVisible = false
                })
            }
        }
    }
}


