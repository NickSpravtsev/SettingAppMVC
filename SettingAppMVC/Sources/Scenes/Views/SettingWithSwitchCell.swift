//
//  SettingWithSwitchCell.swift
//  SettingAppMVC
//
//  Created by Nick Spravtsev on 16.09.2022.
//

import UIKit

class SettingWithSwitchCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "SettingWithSwitchCell"
    
    var settingItem: SettingItem? {
        didSet {
            iconImageView.image = UIImage(systemName: settingItem?.iconName ?? "xmark.octagon.fill")
            iconView.backgroundColor = settingItem?.backgroundColor
            nameLabel.text = settingItem?.name
        }
    }
    
    // MARK: - Outlets
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var settingSwitch: UISwitch = {
        let settingSwitch = UISwitch()
        settingSwitch.addTarget(self, action: #selector(settingSwitchSwithed), for: .valueChanged)
        
        return settingSwitch
    }()
    
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(iconView)
        iconView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(settingSwitch)
    }
    
    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(32)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.width.height.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(iconView.snp.right).offset(10)
        }
        
        settingSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
    }
    
    // MARK: - Actions
    
    @objc private func settingSwitchSwithed() {
        let switchState = settingSwitch.isOn ? "\"????????????????\"" : "\"??????????????????\""
        print("???????????????????? switch ?? ???????????? \"\(nameLabel.text ?? "")\" ?? ?????????????????? \(switchState)")
    }
}
