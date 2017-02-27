//
//  Aview.swift
//  Subviews
//
//  Created by James Rochabrun on 2/26/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class Aview: UIView {
    
    let subView1: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return v
    }()
    
    let subView2: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 1, y: 0, width: 0, height: 0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return v
    }()
    
    let subView3: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 2, y: 0, width: 0, height: 0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        addSubview(subView1)
        addSubview(subView2)
        addSubview(subView3)
        setUpViews()
    }
    
    func setUpViews() {
        
        subView1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        subView1.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        subView1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subView1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        subView2.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        subView2.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        subView2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subView2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        subView3.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        subView3.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        subView3.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subView3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





