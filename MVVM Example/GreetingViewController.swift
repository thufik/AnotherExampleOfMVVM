//
//  ViewController.swift
//  MVVM Example
//
//  Created by EquipeSuporteAplicacao on 8/2/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class GreetingViewController : UIViewController {

    @IBOutlet weak var btnGreeting: UIButton!
    @IBOutlet weak var lblGreeting: UILabel!
    
    
    lazy var viewModel : GreetingViewModelProtocol = { () -> GreetingViewModelProtocol in
        var person = Person(firstName: "Fellipe", lastName: "Thufik")
        
        var vm = GreetingViewModel(person: person)
        
        //EU passo um bloco do que eu quero que seja feito caso o valor de greeting mude
        vm.greetingDidChange = { viewModel in
            self.displayGreetingLabel(viewModel: viewModel)
        }
        
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showGreeting(_ sender: UIButton) {
        self.viewModel.showGreeting()
    }
    
    func displayGreetingLabel(viewModel : GreetingViewModelProtocol){
        self.lblGreeting.text = viewModel.greeting
    }
}

