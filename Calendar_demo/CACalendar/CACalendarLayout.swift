//
//  CACalendarLayout.swift
//  Calendar_demo
//
//  Created by 24hmb on 2017/2/15.
//  Copyright © 2017年 24hmb. All rights reserved.
//

import UIKit

class CACalendarLayout: UICollectionViewLayout {
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
//        let rowsCount = self.collectionView?.numberOfItems(inSection: 0)
//        for row in 0 ..< rowsCount! {
//            
//        }
        
        super.prepare()
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return nil
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return nil
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 0, height: 1000)
    }
}
