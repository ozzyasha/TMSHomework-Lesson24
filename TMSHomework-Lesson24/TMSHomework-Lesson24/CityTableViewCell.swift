//
//  CityTableViewCell.swift
//  TMSHomework-Lesson24
//
//  Created by Наталья Мазур on 20.02.24.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let identifier = "CityTableViewCell"
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.contentView.addSubview(cityLabel)
        self.contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    public func configure(city: City) {
        let date = Date()
        let time = DateFormatter()
        time.timeZone = city.timezone
        time.dateFormat = "HH:mm:ss"
        
        self.cityLabel.text = "\(city.name)"
        self.timeLabel.text = "\(time.string(from: date))"
    }
    
}
