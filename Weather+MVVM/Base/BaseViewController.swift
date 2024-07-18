//
//  BaseViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("base", #function)
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()
    }
    func configureHierarchy() { }
    func configureLayout() { }
    func configureView() { }
}
