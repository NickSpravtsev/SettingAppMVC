//
//  SettingsModel.swift
//  SettingAppMVC
//
//  Created by Nick Spravtsev on 16.09.2022.
//

import Foundation
import UIKit

enum SettingType {
    case simple
    case withSwitch
    case withDetail
    case withNotification
}

struct SettingItem {
    var iconName: String
    var backgroundColor: UIColor = .clear
    var name: String
    var detail = ""
    var type: SettingType
}

extension SettingItem {
    static var settingItems: [[SettingItem]] = [
        [
            SettingItem(iconName: "airplane", backgroundColor: .systemOrange, name: "Авиарежим", type: .withSwitch),
            SettingItem(iconName: "wifi", backgroundColor: .systemBlue, name: "Wi-Fi", detail: "Не подключено", type: .withDetail),
            SettingItem(iconName: "bolt.horizontal.fill", backgroundColor: .systemBlue, name: "Bluetooth", detail: "Вкл.", type: .withDetail),
            SettingItem(iconName: "antenna.radiowaves.left.and.right", backgroundColor: .systemGreen, name: "Сотовая связь", type: .simple),
            SettingItem(iconName: "personalhotspot", backgroundColor: .systemGreen, name: "Режим модема", type: .simple),
            SettingItem(iconName: "network.badge.shield.half.filled", backgroundColor: .systemBlue, name: "VPN", type: .withSwitch)
        ],
        [
            SettingItem(iconName: "bell.badge.fill", backgroundColor: .systemRed, name: "Уведомления", type: .simple),
            SettingItem(iconName: "speaker.wave.3.fill", backgroundColor: .systemRed, name: "Звуки, тактильные сигналы", type: .simple),
            SettingItem(iconName: "moon.fill", backgroundColor: .systemIndigo, name: "Не беспокоить", type: .simple),
            SettingItem(iconName: "hourglass", backgroundColor: .systemIndigo, name: "Экранное время", type: .simple)
        ],
        [
            SettingItem(iconName: "gear", backgroundColor: .systemGray, name: "Основные", type: .withNotification),
            SettingItem(iconName: "switch.2", backgroundColor: .systemGray, name: "Пункт управления", type: .simple),
            SettingItem(iconName: "textformat.size", backgroundColor: .systemBlue, name: "Экран и яркость", type: .simple),
            SettingItem(iconName: "circle.grid.3x3.fill", backgroundColor: .blue, name: "Экран \"Домой\"", type: .simple),
            SettingItem(iconName: "figure.wave.circle", backgroundColor: .systemBlue, name: "Универсальный доступ", type: .simple),
            SettingItem(iconName: "circle.hexagongrid", backgroundColor: .systemCyan, name: "Обои", type: .simple),
            SettingItem(iconName: "waveform", backgroundColor: .systemGray, name: "Siri и поиск", type: .simple),
            SettingItem(iconName: "faceid", backgroundColor: .systemGreen, name: "Face ID и код-пароль", type: .simple),
            SettingItem(iconName: "battery.100", backgroundColor: .systemGreen, name: "Аккумулятор", type: .simple),
            SettingItem(iconName: "hand.raised.fill", backgroundColor: .systemBlue, name: "Конфиденциальность", type: .simple)
        ]]
}
