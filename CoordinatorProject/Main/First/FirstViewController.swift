//
//  FirstViewController.swift
//  CoordinatorProject
//
//  Created by Naman Vaishnav on 21/01/24.
//

import UIKit
import Combine

class FirstViewController: UIViewController {

    var infoLabel: UILabel?
    var viewModel: FirstTabViewModel!
    var showDetailRequested: () -> () = { }
    
    var subscription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupInfoLabel()
        setupDetailButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        infoLabel?.text = "\(viewModel.name) with email \(viewModel.email)"
    }
    
    func setupInfoLabel(){
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        infoLabel.text = "\(viewModel.name) with email \(viewModel.email)"
        self.view.addSubview(infoLabel)
        self.infoLabel = infoLabel
        
        viewModel.$email.combineLatest(viewModel.$name)
            .sink { [weak self] (email, name) in
                if name.count + email.count > 0 {
                    self?.infoLabel?.text = "\(name) with email \(email)"
                } else {
                    self?.infoLabel?.text = ""
                }
                
            }.store(in: &subscription)
    }
    
    func setupDetailButton() {
        let button = UIButton(frame: CGRect(x: 100,
                                            y: 500,
                                            width: 200,
                                            height: 60))
        button.setTitleColor(.systemBlue,
                             for: .normal)
        button.setTitle("Go to Detail",
                        for: .normal)
        
        button.addTarget(self,
                         action: #selector(buttonAction),
                         for: .touchUpInside)
        
        self.view.addSubview(button)
    }

    @objc
    func buttonAction() {
        showDetailRequested()
    }
}
