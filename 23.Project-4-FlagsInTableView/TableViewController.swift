//
//  ViewController.swift
//  23.Project-4-FlagsInTableView
//
//  Created by Валентин Картошкин on 30.04.2025.
//

import UIKit

class TableViewController: UITableViewController {

    private var nameFlags = [String]()
    
    //private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //наполняем массив с именами флагов
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("@3x.png") {
                nameFlags.append(item)
            }
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Country")
        
    }

    //высота ячеек
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = nameFlags[indexPath.row].replacingOccurrences(of: "@3x.png", with: "").uppercased()
        
        //делаю изображение флага с границей:
        if let imageView = cell.imageView {
            imageView.image = UIImage(named: nameFlags[indexPath.row])
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameFlags.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.imageName = nameFlags[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}

