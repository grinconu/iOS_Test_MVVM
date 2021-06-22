//
//  ListViewModel.swift
//  TestMVVM
//
//  Created by German Rincon Urrego on 20/06/21.
//

import Foundation

class ListViewModel {
    
    var listViewCell: Observable<[ListTableViewCellViewModel]> = Observable([])
    
    var service: ServiceList
    
    init() {
        service = ServiceList()
    }
    
    func LoadData(){
        service.getList(completion: { result in
            self.listViewCell.value = result.compactMap({
                ListTableViewCellViewModel(data: $0)
            })
        })
    }
}
