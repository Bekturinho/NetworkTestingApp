//
//  SecondViewControllerModel.swift
//  NetworkTestingApp
//
//  Created by fortune cookie on 4/21/24.
//


/**
 Вторая страница это посты пользователя по запросу https://jsonplaceholder.typicode.com/posts.
 В навигации должно отображаться ФИО выбранного пользователя.
 Сам экран это таблица с постами данного пользователя.
 Ячейка должна содержать только номер позиции и Title.
 */



import Foundation


struct SecondViewControllerModel: Decodable{
    let id: Int
    let title: String
    let body: String
    
    var mainInfo: String {
    "\(id) \(title)"
    }
}
