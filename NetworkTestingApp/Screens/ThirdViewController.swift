//
//  ThirdViewController.swift
//  NetworkTestingApp
//
//  Created by fortune cookie on 4/21/24.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController{
    
    var array = " "
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.text = "Beka"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Beka"
        return label
    }()


    
    override func viewDidLayoutSubviews() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({make in
            make.center.equalTo(view.snp.center)
          
        })
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints({make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(titleLabel.snp.top).offset(100)
          
        })
        
        NetworkService().getINfoForThirdVC(completion: { info in
            DispatchQueue.main.async { [weak self] in
                
                self?.titleLabel.text = info?.title ?? "233"
                self?.descriptionLabel.text = info?.body ?? "322"
            }
           
         
            
        })
        
        
        view.backgroundColor = .white
    }
}
