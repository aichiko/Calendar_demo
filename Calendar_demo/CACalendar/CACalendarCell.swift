//
//  CACalendarCell.swift
//  Calendar_demo
//
//  Created by 24hmb on 2017/2/16.
//  Copyright © 2017年 24hmb. All rights reserved.
//

import UIKit

class CACalendarCell: UICollectionViewCell {
    
    fileprivate let titleLabel = UILabel(frame: CGRect.zero)
    fileprivate let subtitleLabel = UILabel(frame: CGRect.zero)
    fileprivate let eventLabel = UILabel(frame: CGRect.zero)
    
    var title: String? {
        didSet{
            titleLabel.text = title
        }
    }
    
    var subtitle: String? {
        didSet{
            subtitleLabel.text = subtitle
            if oldValue == nil && subtitleLabel.constraints.count==0 {
                titleLabel.snp.makeConstraints({ (make) in
                    make.centerX.equalToSuperview()
                    make.top.greaterThanOrEqualTo(5)
                })
                subtitleLabel.snp.makeConstraints({ (make) in
                    make.centerX.equalToSuperview()
                    make.bottom.lessThanOrEqualTo(-7)
                    make.top.greaterThanOrEqualTo(titleLabel.snp.bottom).offset(0)
                })
            }
        }
    }
    
    var eventNum: Int? {
        didSet{
            eventLabel.isHidden = !(eventNum! > 0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialization()
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        if subtitle == nil {
            titleLabel.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
            })
        }
    }
    
}

extension CACalendarCell {
    public func initialization() {
        self.clipsToBounds = false;
        self.contentView.clipsToBounds = false;
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subtitleLabel)
        self.contentView.addSubview(eventLabel)
        titleLabel.textAlignment = .center
        subtitleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        subtitleLabel.textColor = UIColor.lightGray
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        eventLabel.backgroundColor = UIColor.red
        
        eventLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(5)
            make.bottom.equalTo(-2)
        }
        eventLabel.layer.masksToBounds = true
        eventLabel.layer.cornerRadius = 2.5
        eventLabel.isHidden = true
    }
}
