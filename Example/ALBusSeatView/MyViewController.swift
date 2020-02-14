//
//  ViewController.swift
//  ALBusSeatView
//
//  Created by sonifex on 02/14/2020.
//  Copyright (c) 2020 sonifex. All rights reserved.
//

import UIKit
import ALBusSeatView

class MyViewController : UIViewController {
    
    var seatView: ALBusSeatView?
    
    struct SeatStub {
        let id: Int
        let salable: Bool
        let gender: Bool
        let hall: Bool
    }
    
    var seatList = [SeatStub]()
    var selectedSeatlist = [SeatStub]()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let config = ALBusSeatViewConfig()
        config.selectedSeatBGColor = UIColor(red: 21.0 / 255.0, green: 202.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
        config.soldWomanBGColor = UIColor(red: 1.0, green: 95.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
        config.soldManBGColor = UIColor(red: 61.0 / 255.0, green: 145.0 / 255.0, blue: 1.0, alpha: 1.0)
        config.seatShadowColor = UIColor(red: 146.0 / 255.0, green: 184.0 / 255.0, blue: 202.0 / 255.0, alpha: 0.5)
        
//        config.busFrontImage = UIImage(named: "bus-front-view")
//        config.busFrontImageWidth = 50
        
        config.centerHallInfoText = "Tüm koltukları görebilmek için kaydırınız!"
        seatView = ALBusSeatView(withConfig: config)
        seatView?.delegate = self
        seatView?.dataSource = self
        
        view.addSubview(seatView!)
        self.view = view

        seatView?.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (0...70).forEach { (count) in
            let isHall = (count - 2) % 5 == 0
            let stub = SeatStub(id: count,
                                salable: Bool.random(),
                                gender: Bool.random(),
                                hall: isHall)
            seatList.append(stub)
        }
        seatView?.reload()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let vH = view.frame.height
        let vW = view.frame.width
        seatView?.frame = CGRect(x: 0, y: (vH-250)/2, width: vW, height: 250)
    }
}

extension MyViewController: ALBusSeatViewDelegate {
    
    func seatView(_ seatView: ALBusSeatView,
                  didSelectAtIndex index: Int,
                  seatType: ALBusSeatType) {
        
        let stub = seatList[index]
        selectedSeatlist.append(stub)
        seatView.reload()
    }
    
    func seatView(_ seatView: ALBusSeatView,
                  deSelectAtIndex index: Int,
                  seatType: ALBusSeatType) {
        
        let stub = seatList[index]
        selectedSeatlist.removeAll(where: { $0.id == stub.id })
        seatView.reload()
    }
}

extension MyViewController:  ALBusSeatViewDataSource  {
    
    func seatView(_ seatView: ALBusSeatView, seatNumberForIndex index: Int) -> String {
        let stub = seatList[index]
        return "\(stub.id)"
    }
    
    func seatView(_ seatView: ALBusSeatView, seatTypeForIndex index: Int) -> ALBusSeatType {
        
        let stub = seatList[index]
        
        if stub.hall { // Hall area
            return .none
        } else if selectedSeatlist.contains(where: { $0.id == stub.id }) { // Selected
            return .selected
        } else if stub.salable { // Open for sale
            return .empty
        } else if stub.gender == true { // Full by man
            return .soldMan
        } else if stub.gender == false { // Full by woman
            return .soldWoman
        } else { // Else not a seat
            return .none
        }
    }
    
    func numberOfSections(in seatView: ALBusSeatView) -> Int {
        return 1
    }
    
    func seatView(_ seatView: ALBusSeatView, numberOfSeatInSection section: Int) -> Int {
        return seatList.count
    }
}
// Present the view controller in the Live View window


