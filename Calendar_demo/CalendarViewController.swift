//
//  CalendarViewController.swift
//  Calendar_demo
//
//  Created by 24hmb on 2017/2/15.
//  Copyright © 2017年 24hmb. All rights reserved.
//

import UIKit
import SnapKit

class CalendarViewController: UIViewController {

    var calendarView = CACalendar(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
        // Do any additional setup after loading the view.
        
        calendarView.frame.size = CGSize.init(width: self.view.bounds.size.width, height: 330)
        calendarView.backgroundColor = UIColor.white
        self.view.addSubview(calendarView)
        self.automaticallyAdjustsScrollViewInsets = false
        
        calendarView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(330)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
