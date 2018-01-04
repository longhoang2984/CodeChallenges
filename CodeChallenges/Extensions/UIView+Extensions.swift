//
//  UIView+Extensions.swift
//  CodeChallenges
//
//  Created by Hoàng Cửu Long on 1/4/18.
//  Copyright © 2018 Long Hoàng. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil ,
                bottom: NSLayoutYAxisAnchor? = nil , right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0,
                width: CGFloat = 0, height: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let `top` = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let `left` = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let `bottom` = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: 0 - paddingBottom).isActive = true
        }
        
        if let `right` = right {
            rightAnchor.constraint(equalTo: right, constant: 0 - paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

