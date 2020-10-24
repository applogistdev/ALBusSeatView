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
    var dataManager = SeatDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seatView.config = ExampleSeatConfig()
        seatView.delegate = dataManager
        seatView.dataSource = dataManager
        
        let mock = MockSeatCreater()
        let first = mock.create(count: 45)
        let second = mock.create(count: 45)
        dataManager.seatList = [first,second]
        seatView?.reload()
    }
    
    @IBAction func reloadButtonTapped(_ sender: UIBarButtonItem) {
        dataManager.selectedSeatlist.removeAll()
        seatView.reload(scrollToLeft: true, animated: true)
    }
}
