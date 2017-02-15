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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
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
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    @available(iOS 2.0, *)
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("滑动结束！！！")
        let index = Int(scrollView.contentOffset.x/self.bounds.width)
        months = [index-1, index, index+1]
        //scrollView.setContentOffset(CGPoint.init(x: self.bounds.width, y: 0), animated: false)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
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
        contentView.collectionViewLayout = layout
        contentView.isPagingEnabled = true
        contentView.showsVerticalScrollIndicator = false
        contentView.showsHorizontalScrollIndicator = false
        contentView.allowsMultipleSelection = true
        contentView.clipsToBounds = true
        contentView.delegate = self
        contentView.dataSource = self
        contentView.backgroundColor = UIColor.clear
        contentView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}
