//
//  ListViewModel.swift
//  TestMVVM
//
//  Created by German Rincon Urrego on 20/06/21.
//

import Foundation

class ListViewModel {
    
    //Connect with the viewController
    var refreshData = { () -> () in }
    
    var dataArray: [List] = [] {
        didSet {
            refreshData()
        }
    }
    
    var service: ServiceList
    
    init() {
        service = ServiceList()
    }
    
    func LoadData(){
        service.getList { result in
            self.dataArray = result
        }
    }
}
