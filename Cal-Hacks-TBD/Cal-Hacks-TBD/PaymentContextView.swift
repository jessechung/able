//
//  PaymentContextView.swift
//  Cal-Hacks-TBD
//
//  Created by ananya mukerjee on 1/1/19.
//  Copyright © 2019 Cal-Hacks-5.0. All rights reserved.
//

import UIKit
import Stripe

class PaymentContextFooterView: UIView {
    
    var insetMargins: UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    
    var text: String = "" {
        didSet {
            textLabel.text = text
        }
    }
    
    var theme: STPTheme = STPTheme.default() {
        didSet {
            textLabel.font = theme.smallFont
            textLabel.textColor = theme.secondaryForegroundColor
        }
    }
    
    fileprivate let textLabel = UILabel()
    
    convenience init(text: String) {
        self.init()
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        self.addSubview(textLabel)
        
        self.text = text
        textLabel.text = text
        
    }
    
    override func layoutSubviews() {
        textLabel.frame = UIEdgeInsetsInsetRect(self.bounds, insetMargins)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // Add 10 pt border on all sides
        var insetSize = size
        insetSize.width -= (insetMargins.left + insetMargins.right)
        insetSize.height -= (insetMargins.top + insetMargins.bottom)
        
        var newSize = textLabel.sizeThatFits(insetSize)
        
        newSize.width += (insetMargins.left + insetMargins.right)
        newSize.height += (insetMargins.top + insetMargins.bottom)
        
        return newSize
    }
    
    
}
