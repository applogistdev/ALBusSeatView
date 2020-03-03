//
//  StoryboardExampleViewController.swift
//  ALBusSeatView_Example
//
//  Created by Soner Güler on 21.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ALBusSeatView

class StoryboardExampleViewController: UIViewController {
    
    @IBOutlet weak var seatView: ALBusSeatView!

    var seatList = [[SeatStub]]()
    var selectedSeatlist = [SeatStub]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = ALBusSeatViewConfig()
        config.seatSelectedBGColor = UIColor(red: 21.0 / 255.0, green: 202.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
        config.seatSoldWomanBGColor = UIColor(red: 1.0, green: 95.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
        config.seatSoldManBGColor = UIColor(red: 61.0 / 255.0, green: 145.0 / 255.0, blue: 1.0, alpha: 1.0)
        config.seatShadowColor = UIColor(red: 146.0 / 255.0, green: 184.0 / 255.0, blue: 202.0 / 255.0, alpha: 0.5)
        config.busFrontImage = UIImage(named: "bus-front-view")
        config.busFrontImageWidth = 120
        config.floorSeperatorImage = UIImage(named: "bus-docker-front-view")
        config.seatRemoveImage = UIImage(named: "iconRemoveButton")
        config.floorSeperatorWidth = 60
        config.centerHallInfoText = "Swipe!"
        config.centerHallHeight = 40
        config.tooltipText = "Select"
        
        seatView.config = config
        seatView.delegate = self
        seatView.dataSource = self
        
        let first = getStubList(total: 45)
        let second = getStubList(total: 30)
        seatList = [first,second]
        seatView?.reload()
    }
    
    
    func getStubList(total: Int) -> [SeatStub] {
        var list = [SeatStub]()
        (0...total).forEach { (count) in
            let isHall = (count - 2) % 5 == 0
            let stub = SeatStub(id: UUID().uuidString,
                                number: count,
                                salable: Bool.random(),
                                gender: Bool.random(),
                                hall: isHall)
            list.append(stub)
        }
        return list
    }
    
    @IBAction func reloadButtonTapped(_ sender: UIBarButtonItem) {
        selectedSeatlist.removeAll()
        seatView.reload()
    }
    
}


extension StoryboardExampleViewController: ALBusSeatViewDelegate {
    
    func seatView(_ seatView: ALBusSeatView, didSelectAtIndex indexPath: IndexPath, seatType: ALBusSeatType, selectionType: ALSelectionType) {
        
        var stub = seatList[indexPath.section][indexPath.item]
        stub.gender = selectionType == .man ? true : false
        selectedSeatlist.append(stub)
        seatView.reload()
    }
    
    func seatView(_ seatView: ALBusSeatView, deSelectAtIndex indexPath: IndexPath, seatType: ALBusSeatType) {
        
        let stub = seatList[indexPath.section][indexPath.item]
        selectedSeatlist.removeAll(where: { $0.id == stub.id })
        seatView.reload()
    }
}

extension StoryboardExampleViewController:  ALBusSeatViewDataSource  {
    
    func seatView(_ seatView: ALBusSeatView, seatNumberForIndex indexPath: IndexPath) -> String {
        let stub = seatList[indexPath.section][indexPath.item]
        return "\(stub.number)"
    }
    
    func seatView(_ seatView: ALBusSeatView, seatTypeForIndex indexPath: IndexPath) -> ALBusSeatType {
        
        let stub = seatList[indexPath.section][indexPath.item]
        
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
        return seatList.count
    }
    
    func seatView(_ seatView: ALBusSeatView, numberOfSeatInSection section: Int) -> Int {
        return seatList[section].count
    }
}
