//
//  NetworkService.swift
//  NetworkTestingApp
//
//  Created by fortune cookie on 4/10/24.
//

import UIKit

class NetworkService{
    private var session = URLSession.shared

    
    func getINfoForFirstVC(completion:  @escaping ([FirstViewControllerModel?]) -> Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = session.dataTask(with: urlRequest) { data, response, error in
//            print(data,response,error)
            
            guard let httpsrResponce = response as? HTTPURLResponse, httpsrResponce.statusCode >= 200 && httpsrResponce.statusCode < 300 else {
            print("Something wrong happened")
                return
            }
            
            guard error == nil else{
                print("Something wrong happened in requesting: \(error!)")
                return
            }
            
            guard let data else{
                print("Something wrong happened , data is nil")
                return
                }
            
            let decoder = JSONDecoder()
            
            do{
                let model = try decoder.decode([FirstViewControllerModel].self, from: data)
                completion(model)
             
                
//                print(model)
                
            }catch{
                completion([nil])
            }
        
        }
        
        task.resume()
    }
    
   
    func getINfoForSecondVC(completion:  @escaping ([SecondViewControllerModel?]) -> Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = session.dataTask(with: urlRequest) { data, response, error in
//            print(data,response,error)
            
            guard let httpsrResponce = response as? HTTPURLResponse, httpsrResponce.statusCode >= 200 && httpsrResponce.statusCode < 300 else {
            print("Something wrong happened")
                return
            }
            
            guard error == nil else{
                print("Something wrong happened in requesting: \(error!)")
                return
            }
            
            guard let data else{
                print("Something wrong happened , data is nil")
                return
                }
            
            let decoder = JSONDecoder()
            
            do{
                let model = try decoder.decode([SecondViewControllerModel].self, from: data)
                completion(model)
             
                
             
                
            }catch{
                completion([nil])
            }
        
        }
        
        task.resume()
    }
    
    func getINfoForThirdVC(completion:  @escaping (ThirdViewControllerModel?) -> Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = session.dataTask(with: urlRequest) { data, response, error in
//            print(data,response,error)
            
            guard let httpsrResponce = response as? HTTPURLResponse, httpsrResponce.statusCode >= 200 && httpsrResponce.statusCode < 300 else {
            print("Something wrong happened")
                return
            }
            
            guard error == nil else{
                print("Something wrong happened in requesting: \(error!)")
                return
            }
            
            guard let data else{
                print("Something wrong happened , data is nil")
                return
                }
            
            let decoder = JSONDecoder()
            
            do{
                let model = try decoder.decode(ThirdViewControllerModel.self, from: data)
                completion(model)
             
                print(model)
                
             
                
            }catch{
                completion(nil)
            }
        
        }
        
        task.resume()
    }
}
