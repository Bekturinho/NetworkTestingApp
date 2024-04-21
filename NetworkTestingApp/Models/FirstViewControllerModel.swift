//
//  FirstViewControllerModel.swift
//  NetworkTestingApp
//
//  Created by fortune cookie on 4/10/24.
//

/**
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
import Foundation

struct FirstViewControllerModel: Decodable{
    let name: String
    let email: String
    let address: Address

    
    var fullInfo: String {
        "\(name) \(email) \(address.city) \(address.zipcode)"
    }
}

struct Address: Decodable{
    let city, zipcode: String
}


