//
//  ReuseableView.swift
//  ReusableView
//
//  Created by Yunan Xu on 05/12/2017.
//  Copyright © 2017 xuyunan0113@gmail.com. All rights reserved.
//

import UIKit

@IBDesignable
class ReuseableView: UIView {

    @IBInspectable var imageCornerRadius: CGFloat = 0 {
        didSet {
            imageView.layer.cornerRadius = imageCornerRadius
        }
    }
    
    @IBInspectable var imageBackgroundColor: UIColor = .orange {
        didSet {
            imageView.backgroundColor = imageBackgroundColor
        }
    }
    
    @IBInspectable var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBInspectable var titleColor: UIColor = .black {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        // 这种写法, 只有运行在模拟器里才看到出效果
        // let bundle = Bundle.main
        // 推荐这种写法, 这样, 当点击到storyboard里面时, 运行时会及时渲染显示到xib上
        let bundle = Bundle(for: type(of: self))
        let view = bundle.loadNibNamed("ReuseableView", owner: self, options: nil)?.first as! UIView
        self.addSubview(view)
        
        // 不使用autoresizing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // 使用autolayout VFL
        let views = ["view": view]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",   // ps: |-[view]-| 这样写会有默认的margin
                                                          options: NSLayoutFormatOptions.alignAllCenterX,
                                                          metrics: nil,
                                                          views: views)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                          options: NSLayoutFormatOptions.alignAllCenterY,
                                                          metrics: nil,
                                                          views: views)
        self.addConstraints(hConstraints + vConstraints)
    }

}
