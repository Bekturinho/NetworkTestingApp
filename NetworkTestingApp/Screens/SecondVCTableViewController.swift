//
//  SecondVCTableViewController.swift
//  NetworkTestingApp
//
//  Created by fortune cookie on 4/21/24.
//

import UIKit
import SnapKit

class SecondVCTableViewController: UIViewController{
    
    private lazy var goToViewControllerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go To VC", for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(goToSecodView), for: .touchUpInside)
        return button
    }()
   
    
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Beka"
        return label
    }()

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(postLabel)
        postLabel.snp.makeConstraints({make in
            make.center.equalTo(view.snp.center)
          
        })
        
        view.backgroundColor = .white
        
        
        view.addSubview(goToViewControllerButton)
        goToViewControllerButton.snp.makeConstraints({make in
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.centerX.equalTo(view.snp.centerX)
          
        })
        
        
    }
    func check(body: String){
        postLabel.text = body
    }
    
    @objc func goToSecodView(){
        let controller = ThirdViewController()
        navigationController?.pushViewController(controller, animated: true)
       
    }

   
    
}



