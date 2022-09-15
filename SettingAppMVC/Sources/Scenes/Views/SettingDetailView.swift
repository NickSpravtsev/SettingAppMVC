//
//  SettingDetailView.swift
//  SettingAppMVC
//
//  Created by Nick Spravtsev on 16.09.2022.
//

import UIKit

class SettingDetailView: UIView {
    
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
        label.font = UIFont.boldSystemFont(ofSize: 28)
        
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        
        return label
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
        addSubview(iconView)
        iconView.addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(detailLabel)
    }
    
    private func setupLayout() {
        backgroundColor = .systemGray6
        
        iconView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.height.width.equalTo(100)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.height.width.equalTo(70)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(iconView.snp.bottom).offset(30)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
    }
    
    // MARK: - Configure
    
    func configureView(with item: SettingItem?) {
        iconImageView.image = UIImage(systemName: item?.iconName ?? "xmark.octagon.fill")
        iconView.backgroundColor = item?.backgroundColor
        nameLabel.text = item?.name
        detailLabel.text = item?.detail
    }
}
