//
//  Observable.swift
//  TestMVVM
//
//  Created by German Rincon Urrego on 21/06/21.
//

import Foundation

class Observable<T>{
    var value: T?{
        didSet{
            listeners.forEach{
                $0(value)
            }
        }
    }
    
    private var listeners: [((T?) -> Void)] = []
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T?) -> Void){
        listener(value)
        self.listeners.append(listener)
    }
}
