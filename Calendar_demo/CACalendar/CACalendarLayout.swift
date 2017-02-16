//
//  CACalendarLayout.swift
//  Calendar_demo
//
//  Created by 24hmb on 2017/2/15.
//  Copyright © 2017年 24hmb. All rights reserved.
//

import UIKit

let columnCount: Int = 7
let minSpace = CGFloat(10)//cell之间最小的间距
var cellWidth: CGFloat = 40
//还需要计算不同高度的时候cell之间的间隙
let cellInsets = UIEdgeInsetsMake(5, 5, 5, 5)

class CACalendarLayout: UICollectionViewLayout {
    
    var attributesArray = [UICollectionViewLayoutAttributes]()
    
    var lefts = [CGFloat]()//item point—x
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        attributesArray.removeAll()
        
        self.collectionView?.contentOffset = CGPoint(x: (self.collectionView?.bounds.width)!, y: 0)
        let rowsCount = self.collectionView?.numberOfItems(inSection: 0)
        for item in 0 ..< rowsCount! {
            let indexPath = IndexPath.init(item: item, section: 0)
            let attributes = layoutAttributesForItem(at: indexPath)
            attributesArray.append(attributes!)
        }
        
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let item = indexPath.item
        let orgin_x = CGFloat(item/42) * (self.collectionView?.bounds.width)!
        let orgin_y = CGFloat(item/42) * (self.collectionView?.bounds.height)!
        let cellSize = estimatedItemSize()
        print("origin_X === \(orgin_x)")
        let point_x = orgin_x + cellInsets.left + (cellSize.width+cellInsets.left+cellInsets.right) * CGFloat(item%columnCount)
        let point_y = cellInsets.top + (cellSize.height+cellInsets.top+cellInsets.bottom) * CGFloat(item/columnCount) - orgin_y
        attributes.frame = CGRect(x: point_x, y: point_y, width: cellSize.width, height: cellSize.height)
        return attributes
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return nil
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: (self.collectionView?.bounds.width)!*CGFloat((self.collectionView?.numberOfSections)!), height: (self.collectionView?.bounds.height)!)
    }
}

extension UICollectionViewLayout {
    //通过collectionView的大小来算出cell的预计大小
    public func estimatedItemSize() -> CGSize {
        let width = CGFloat((self.collectionView?.frame.width)!/7) - cellInsets.left - cellInsets.right
        let  height = CGFloat((self.collectionView?.frame.height)!/6.0) - cellInsets.top - cellInsets.bottom
        print("width ==\(width) height ==\(height)")
        return CGSize(width: width, height: height)
    }
    
    //算出所有的item的X 坐标
    public func lefts(_ indexPath: IndexPath) -> [CGFloat] {
        return []
    }
}
