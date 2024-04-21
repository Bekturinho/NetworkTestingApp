//
//  ViewController.swift
//  NetworkTestingApp
//
//  Created by fortune cookie on 4/10/24.
//

import UIKit
import SnapKit
/**
 Создать простое приложение, используя Network Layer.
 MVC как архитектуру
 Snapkit для верстки

 Суть приложения проста: 3 экрана.

 Первый экран это таблица с пользователями по запросу https://jsonplaceholder.typicode.com/users.
 Ячейка должна содержать информацию о пользователе:
 ФИО
 Email
 Город проживания и Zip-code
 Название компании
 При нажатии на ячейку пользователя должен открываться второй экран с постами данного пользователя.

 Вторая страница это посты пользователя по запросу https://jsonplaceholder.typicode.com/posts.
 В навигации должно отображаться ФИО выбранного пользователя.
 Сам экран это таблица с постами данного пользователя.
 Ячейка должна содержать только номер позиции и Title.

 Третья страница - детальная страница поста по запросу https://jsonplaceholder.typicode.com/posts/1.

 Обычный экран с двумя лейблами: первый лейбл должен содержать тайтл, второй должен содержать дескрипшн.

 Юай не имеет значения. Главное код.
 
 
 
 {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
 */



class ViewController: UIViewController {

    private lazy var infoTableView = UITableView()
    
    private var userInfoArray: [FirstViewControllerModel?] = []
    
    
    private lazy var goToViewControllerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go To VC", for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(goToSecodView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubViews()
        print(userInfoArray.isEmpty)
       
    }


    private func setUpSubViews(){
        
        view.addSubview(infoTableView)
        infoTableView.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom).offset(100)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)

        })
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.identifier)
        infoTableView.dataSource = self
        
        NetworkService().getINfoForFirstVC(completion: { info in
            DispatchQueue.main.async { [weak self] in
                self?.userInfoArray = info
                
                self?.infoTableView.reloadData()
                
            }
           
         
            
        })
 
        view.addSubview(goToViewControllerButton)
        
        goToViewControllerButton.snp.makeConstraints({make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.width.equalTo(view.alpha).offset(200)
            make.height.equalTo(view.alpha).offset(40)
            goToViewControllerButton.layer.cornerRadius = 12
        })
        
            
            
    }
    
    @objc func goToSecodView(){
        let controller = SecondViewController()
        navigationController?.pushViewController(controller, animated: true)
       
    }
                                 
        
    }
        
                                
    


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        userInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = infoTableView.dequeueReusableCell(withIdentifier: ViewController.identifier, for: indexPath)
        let data = userInfoArray[indexPath.row]
        
        cell.textLabel?.text = data?.fullInfo
        
        return cell
    }
    
    
    
}
