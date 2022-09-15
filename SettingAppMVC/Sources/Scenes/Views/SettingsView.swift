//
//  SettingsView.swift
//  SettingAppMVC
//
//  Created by Nick Spravtsev on 16.09.2022.
//

import UIKit
import SnapKit

class SettingsView: UIView {

    // MARK: - Outlets

    var settingsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)

        tableView.register(SettingSimpleCell.self, forCellReuseIdentifier: SettingSimpleCell.identifier)
        tableView.register(SettingWithDetailCell.self, forCellReuseIdentifier: SettingWithDetailCell.identifier)
        tableView.register(SettingWithSwitchCell.self, forCellReuseIdentifier: SettingWithSwitchCell.identifier)
        tableView.register(SettingWithNotificationCell.self, forCellReuseIdentifier: SettingWithNotificationCell.identifier)

        tableView.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)

        return tableView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(self)
        }
    }
}
