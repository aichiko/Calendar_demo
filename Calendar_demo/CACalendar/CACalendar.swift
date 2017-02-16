//
//  CACalendar.swift
//  Calendar_demo
//
//  Created by 24hmb on 2017/2/15.
//  Copyright © 2017年 24hmb. All rights reserved.
//

import UIKit

let cellIdentifier = "cell"

class CACalendar: UIView, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var contentView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    var months: Array = [Any]()
    
    let formatter = DateFormatter.init()
    let gregorian = Calendar.init(identifier: .gregorian)//公历
    let components = DateComponents.init()
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }

    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionNumbers()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CACalendarCell
        cell.backgroundColor = UIColor.orange
        cell.title = String(indexPath.item)
        cell.eventNum = indexPath.item%3 - 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print(indexPath)
    }
    
    @available(iOS 2.0, *)
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("滑动结束！！！")
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        months = [index-1, index, index+1]
        //scrollView.setContentOffset(CGPoint.init(x: scrollView.bounds.width, y: 0), animated: false)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        super.init(coder: aDecoder)
        configCollectionView()
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configCollectionView() {
        self.addSubview(contentView)
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        loadView(rect: self.bounds)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
}

extension CACalendar {
    func loadView(rect: CGRect) {
        let layout = CACalendarLayout()
        contentView.collectionViewLayout = UICollectionViewFlowLayout()
        contentView.isPagingEnabled = true
        contentView.showsVerticalScrollIndicator = false
        contentView.showsHorizontalScrollIndicator = false
        contentView.allowsMultipleSelection = true
        contentView.clipsToBounds = true
        contentView.delegate = self
        contentView.dataSource = self
        contentView.backgroundColor = UIColor.clear
        contentView.register(CACalendarCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        formatter.dateFormat = "yyyy-MM-dd"
    }
    
    func sectionNumbers() -> Int {
        var minimumDate = formatter.date(from: "1970-01-01")
        var maximumDate = formatter.date(from: "2099-12-31")
        //加入当前时区
        let zone = TimeZone.current
        let interval = zone.secondsFromGMT(for: Date())
        minimumDate?.addTimeInterval(TimeInterval(interval))
        maximumDate?.addTimeInterval(TimeInterval(interval))
        
        let months = gregorian.dateComponents([.month], from: minimumDate!, to: maximumDate!).month!+1
        return months
    }
}
