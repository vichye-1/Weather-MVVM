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
        configureTableView()
        configureCollectionView()
    }
    func configureHierarchy() { }
    func configureLayout() { }
    func configureView() { }
    func configureTableView() { }
    func configureCollectionView() { }
}
