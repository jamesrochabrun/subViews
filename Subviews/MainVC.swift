//
//  ViewController.swift
//  Subviews
//
//  Created by James Rochabrun on 2/24/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//PROBLEM : Lets say you have a view on a view controller. 
//1 The view is not a property on the view controller, but it is on one of the subviews of it's view. 
//2 The goal is to locate that view on a different instance of the same ViewController class. Remember, You can't do object comparison, because the view controllers are not the same instance. We talked about providing "directions" on how to get to that view from the root view.



class MainVC: UIViewController {
    
    lazy var button: UIButton = {
        let b = UIButton()
        b.setTitle("Segue", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        b.addTarget(self, action: #selector(showVC), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUPSubView()
    }
    
    func setUPSubView() {
        
        view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        //1 The view is not a property on the view controller, but it is on one of the subviews of it's view
        let aView = Aview()
        view.addSubview(aView)
        aView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        aView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        aView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func showVC() {
        let secondVC = SecondVC()
        secondVC.mainVC = self
        navigationController?.pushViewController(secondVC, animated: true)
    }

    
}










