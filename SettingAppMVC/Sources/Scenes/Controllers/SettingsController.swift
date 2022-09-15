//
//  ViewController.swift
//  SettingAppMVC
//
//  Created by Nick Spravtsev on 15.09.2022.
//

import UIKit

class SettingsController: UIViewController {
    
    // MARK: - Properties
    
    private var settingItems: [[SettingItem]]?
    private var tableView: UITableView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settingView = SettingsView()
        view = settingView
        title = "Настройки"
        tableView = settingView.settingsTableView
        tableView?.dataSource = self
        tableView?.delegate = self
        
        settingItems = SettingItem.settingItems
    }
}

// MARK: - Extensions

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItems?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = settingItems?[indexPath.section][indexPath.row]
        
        switch item?.type {
        case .simple:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSimpleCell.identifier, for: indexPath) as? SettingSimpleCell
            cell?.settingItem = item
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .withSwitch:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingWithSwitchCell.identifier, for: indexPath) as? SettingWithSwitchCell
            cell?.settingItem = item
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        case .withDetail:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingWithDetailCell.identifier, for: indexPath) as? SettingWithDetailCell
            cell?.settingItem = item
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .withNotification:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingWithNotificationCell.identifier, for: indexPath) as? SettingWithNotificationCell
            cell?.settingItem = item
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.selectionStyle == UITableViewCell.SelectionStyle.none {
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("Нажата ячейка \"\(settingItems?[indexPath.section][indexPath.row].name ?? "")\"")
    }
}
