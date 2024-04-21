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



class SecondViewController: UIViewController {

    private lazy var infoTableView = UITableView()
    
    private var userInfoArray: [SecondViewControllerModel?] = []
    
    private var postsArray: [String] = []
    
    var delegate: DelegateForSecondView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubViews()
        infoTableView.dataSource = self
        infoTableView.delegate = self
       
    }


    private func setUpSubViews(){
        
        view.addSubview(infoTableView)
        infoTableView.snp.makeConstraints({make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom).offset(-100)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)

        })
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: SecondViewController.identifier)
        
    
 
        NetworkService().getINfoForSecondVC(completion: { info in
            DispatchQueue.main.async { [weak self] in
                self?.userInfoArray = info
                
                self?.infoTableView.reloadData()
                   
                
            }
            
         
            
        })

            
            
    }
                                 
        
    }
        
                                
extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = infoTableView.dequeueReusableCell(withIdentifier: SecondViewController.identifier, for: indexPath)
        
        let data = userInfoArray[indexPath.row]
        cell.textLabel?.text = data?.mainInfo
        postsArray.append(data?.body ?? "0")
        return cell
    }
    
    
}
extension SecondViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = postsArray[indexPath.row]
        let controller = SecondVCTableViewController()
        navigationController?.pushViewController(controller, animated: true)
        controller.check(body: post)
        
   
    
        
    }
}



    
    

