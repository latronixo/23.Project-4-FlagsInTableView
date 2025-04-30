//
//  DetailViewController.swift
//  23.Project-4-FlagsInTableView
//
//  Created by Валентин Картошкин on 30.04.2025.
//

import UIKit

class DetailViewController: UIViewController {

    var imageName: String?
    
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.layer.borderColor = UIColor.lightGray.cgColor
        element.layer.borderWidth = 1.0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        navigationItem.largeTitleDisplayMode = .never
        if let imgName = imageName {
            title = imgName.replacingOccurrences(of: "@3x.png", with: "").uppercased()
        }
        
        setViews()
        setConstraints()
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else
        {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, imageName ?? ""], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    private func setViews() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        
        if let fileName = imageName {
            imageView.image = UIImage(named: fileName)
        }
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
