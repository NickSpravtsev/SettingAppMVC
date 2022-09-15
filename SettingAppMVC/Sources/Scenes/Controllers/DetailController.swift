//
//  DetailController.swift
//  SettingAppMVC
//
//  Created by Nick Spravtsev on 16.09.2022.
//

import UIKit

class DetailController: UIViewController {
    
    // MARK: - Properties
    
    private let detailView = SettingDetailView()
    var settingItem: SettingItem? {
        didSet {
            detailView.configureView(with: settingItem)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController() 
    }
    
    // MARK: Setup
    
    private func setupController() {
        view = detailView
    }
}
