//
//  ViewController.swift
//  TMSHomework-Lesson24
//
//  Created by Наталья Мазур on 19.02.24.
//

import UIKit

class ViewController: UIViewController {

    let citiesArray: [City] = [City(name: "New York", timezone: TimeZone(identifier: "America/New_York")!)]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else {
            fatalError("The TableView could not dequeue a CityTableViewCell in ViewController")
        }
        
        cell.configure(city: citiesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

/* Домашнее задание:

Создайте структуру City для представления информации о городах, включая название города и его часовой пояс (разницу относительно UTC). +

Создайте массив объектов City, представляющих разные города в мире, например, Нью-Йорк, Лондон, Токио и другие.

Используйте текущее время (Date) и DateFormatter, чтобы отобразить текущее мировое время для каждого из выбранных городов.

Отображайте время в формате "HH:mm:ss" с учетом часового пояса каждого города. */
