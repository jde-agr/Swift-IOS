//
//  ViewController.swift
//  ex00
//
//  Created by jasmine DE-AGRELA on 2019/10/10.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var images_cache = [String:UIImage]()
    var images: [String] = [
//        "ddd",
    "https://www.nasa.gov/sites/default/files/styles/ubernode_alt_horiz/public/thumbnails/image/iss059e111688.jpg",
    "https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/ksc-20190927-ph-mtd01_0086_large.jpg",
    "https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/ssc2019-15b_med.jpg",
    "https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/iss060e080405_large.jpg",
    "https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
    "https://images.pexels.com/photos/2734512/pexels-photo-2734512.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "https://images.pexels.com/photos/186980/pexels-photo-186980.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        
        "http://dsd.jpg"
    ]

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.center = cell.contentView.center
        cell.contentView.addSubview(activityView)
        activityView.startAnimating()
        if (images_cache[images[indexPath.row]] != nil)
        {
            print("nnoo")
            cell.bg.image = images_cache[images[indexPath.row]]
        }
        else
        {
            print("yeess")
            load_image(images[indexPath.row], imageview:cell.bg, activityView:activityView)
        }
        return cell
    }
    
    func load_image(_ link:String, imageview:UIImageView, activityView: UIActivityIndicatorView) {
        let url:URL = URL(string: link)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.timeoutInterval = 10
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in

            guard let _:Data = data, let _:URLResponse = response, error == nil else {
                print("popo")
                DispatchQueue.main.async {
                    activityView.stopAnimating()
                    imageview.image = UIImage(imageLiteralResourceName: "error.png")
                    let alert = UIAlertController(title: "ERROR", message: "Could not download image from \(link)", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(alert, animated: true)
                    if self.presentedViewController == nil {
                        self.present(alert, animated: true)
//                        self.present(alert, animated: true, completion: nil)
                    }
                }
                return
            }
                
            var image = UIImage(data: data!)
            print(data)
            if (image != nil)
            {
                func set_image()
                {
                    self.images_cache[link] = image
                    imageview.image = image
                    let container: UIView = UIView()
                    imageview.addSubview(container)
                    activityView.stopAnimating()
                }
                DispatchQueue.main.async(execute: set_image)
            }
        })
        task.resume()
    }
}

class CustomCell: UICollectionViewCell {
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
