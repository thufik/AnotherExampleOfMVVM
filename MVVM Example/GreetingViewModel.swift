//
//  GreetingViewModel.swift
//  MVVM Example
//
//  Created by EquipeSuporteAplicacao on 8/2/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Foundation

protocol GreetingViewModelProtocol {
    var greeting : String? {get}
    var greetingDidChange : ((GreetingViewModelProtocol) -> ())? {get set}
    init(person : Person)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    
    let person : Person
    
    required init(person: Person) {
       self.person = person
    }
    
    var greeting: String? {
        didSet{
            self.greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    func showGreeting() {
        self.greeting = "Hello" + " " + person.firstName + " " + person.lastName
    }
}
