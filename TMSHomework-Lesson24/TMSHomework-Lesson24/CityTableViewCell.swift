//
//  CityTableViewCell.swift
//  TMSHomework-Lesson24
//
//  Created by Наталья Мазур on 20.02.24.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let identifier = "CityTableViewCell"
    
    let timezoneLabel: UILabel = {
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
        self.contentView.addSubview(timezoneLabel)
        
        NSLayoutConstraint.activate([
            timezoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timezoneLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    public func configure(city: City) {
        self.timezoneLabel.text = "\(city.name) \(city.timezone.description)"
    }
    
}
