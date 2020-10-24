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
    
    var dataManager = SeatDataManager()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        seatView = ALBusSeatView(withConfig: ExampleSeatConfig())
        seatView?.delegate = dataManager
        seatView?.dataSource = dataManager
        
        view.addSubview(seatView!)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let first = MockSeatCreater().create(count: 45)
        dataManager.seatList = [first]
        seatView?.reload()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let vH = view.frame.height
        let vW = view.frame.width
        seatView?.frame = CGRect(x: 0, y: (vH-250)/2, width: vW, height: 250)
    }
}
