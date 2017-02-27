//
//  SecondVCViewController.swift
//  Subviews
//
//  Created by James Rochabrun on 2/26/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var mainVC: MainVC?
    let displayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(displayView)
        displayView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        displayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        displayView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        displayView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        
//2 The goal is to locate that view on a different instance of the same ViewController class. Remember, You can't do object comparison, because the view controllers are not the same instance. We talked about providing "directions" on how to get to that view from the root view. 

        //newinstance
        let mainVCInstance = MainVC()

        //subViews to look up in newInstance

        //here a is a subview of mainVCInstance
        if let a = mainVCInstance.view.subviews[1] as? Aview, let mainVC = self.mainVC {
            //here viewToFind is a subview of a and also a property of a
            let viewToFind = a.subView2 //YELLOW COLOR
            let foundedView = findView(view: viewToFind, inViewController: mainVC)
            
            displayFoundedViewBackgroundColor(foundedView)
        }
    }
    
    //SOLUTION
    func findView(view: UIView, inViewController vc: UIViewController) -> UIView {
        
        //1 Go up to the rootView using the view passed as argument
        let root = view.rootViewOf()
        print("ROOT:", root)
        
        //2 append the indexes in an array one level up at the time
        let indexes = view.oneLevelUp()
        print("INDEXES", indexes)
        
        //3 reverse the array and loop through it going down one level from the vc.view
        let foundView = vc.view.oneLevelDown(indexes)
        
        print("ARGUMENT VIEW.BACKGROUNDCOLOR: \(view.backgroundColor) \n RESULT VIEW.BACKGROUNDCOLOR \(foundView.backgroundColor)")
        return foundView
    }
    
    func displayFoundedViewBackgroundColor(_ foundedView: UIView) {
        displayView.backgroundColor = foundedView.backgroundColor
    }
}

extension UIView {
    
    func rootViewOf() -> UIView{
        var view = self
        while view.superview != nil {
            view = view.superview!
        }
        return view
    }
    
    func oneLevelUp() -> [Int] {
        var view = self
        var indexes = [Int]()
        
        while view.superview != nil {
            let oneLevelUp = view.superview
            let index = oneLevelUp?.subviews.index(of: view)
            indexes.append(index!)
            view = oneLevelUp!
        }
        return indexes
    }
    
    func oneLevelDown(_ indexes: Array<Int>) -> UIView {
        
        var view = self
        for i in indexes.reversed() {
            let oneLevelDown = view.subviews[i]
            view = oneLevelDown
        }
        return view
    }
}


















