//
//  DetailViewController.swift
//  AppleMusicSample
//
//  Created by Karthik Shyadanhalli Madeve Gowda on 2/29/20.
//  Copyright © 2020 Karthik Shyadanhalli Madeve Gowda. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController {
   
    var album:Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        guard let album = album else {
            return

        }
        view.addSubview(albumImage)
        view.addSubview(albumName)
        view.addSubview(artistTitle)
        view.addSubview(artistName)
        view.addSubview(releaseDateTitle)
        view.addSubview(releaseDate)
        view.addSubview(genreTitle)
        view.addSubview(genre)
        view.addSubview(copyright)
        view.addSubview(iTunesButton)
        
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumName.translatesAutoresizingMaskIntoConstraints = false
        artistTitle.translatesAutoresizingMaskIntoConstraints = false
        artistName.translatesAutoresizingMaskIntoConstraints = false
        releaseDateTitle.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        genreTitle.translatesAutoresizingMaskIntoConstraints = false
        copyright.translatesAutoresizingMaskIntoConstraints = false
        genre.translatesAutoresizingMaskIntoConstraints = false
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false

        loadImage()
        albumImage.centerXAnchor.constraint(equalTo:self.view.centerXAnchor, constant:0).isActive = true
        albumImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        albumImage.heightAnchor.constraint(equalToConstant:300).isActive = true
         albumImage.heightAnchor.constraint(equalToConstant:300).isActive = true
        
        
        //albumName.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:10).isActive = true
        albumName.centerXAnchor.constraint(equalTo:self.view.centerXAnchor, constant:0).isActive = true
        //albumName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10).isActive = true
        albumName.topAnchor.constraint(equalTo: self.albumImage.bottomAnchor, constant: 0).isActive = true
        albumName.heightAnchor.constraint(equalToConstant:30).isActive = true
        albumName.text = album.albumName
        
        artistTitle.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:10).isActive = true
        artistTitle.topAnchor.constraint(equalTo: self.albumName.bottomAnchor, constant: 10).isActive = true
        artistTitle.heightAnchor.constraint(equalToConstant:30).isActive = true
        artistTitle.widthAnchor.constraint(equalToConstant:100).isActive = true
        artistTitle.text = "Artist :"
        
        artistName.leadingAnchor.constraint(equalTo:self.artistTitle.trailingAnchor, constant:10).isActive = true
        artistName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        artistName.topAnchor.constraint(equalTo: self.albumName.bottomAnchor, constant: 10).isActive = true
        artistName.heightAnchor.constraint(equalToConstant:30).isActive = true
        artistName.text = album.artistName
        
        releaseDateTitle.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:10).isActive = true
        releaseDateTitle.topAnchor.constraint(equalTo: self.artistTitle.bottomAnchor, constant: 0).isActive = true
        releaseDateTitle.heightAnchor.constraint(equalToConstant:30).isActive = true
        releaseDateTitle.widthAnchor.constraint(equalToConstant:100).isActive = true
        releaseDateTitle.text = "Released on :"

        releaseDate.leadingAnchor.constraint(equalTo:self.releaseDateTitle.trailingAnchor, constant:10).isActive = true
        releaseDate.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        releaseDate.topAnchor.constraint(equalTo: self.artistName.bottomAnchor, constant: 0).isActive = true
        releaseDate.heightAnchor.constraint(equalToConstant:30).isActive = true
        releaseDate.text = album.releaseDate

        
        genreTitle.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:10).isActive = true
        genreTitle.topAnchor.constraint(equalTo: self.releaseDate.bottomAnchor, constant: 0).isActive = true
        genreTitle.heightAnchor.constraint(equalToConstant:30).isActive = true
        genreTitle.widthAnchor.constraint(equalToConstant:100).isActive = true
        genreTitle.text = "Genre :"

        genre.leadingAnchor.constraint(equalTo:self.genreTitle.trailingAnchor, constant:10).isActive = true
        genre.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10).isActive = true
        genre.topAnchor.constraint(equalTo: self.releaseDate.bottomAnchor, constant: 0).isActive = true
        genre.heightAnchor.constraint(equalToConstant:30).isActive = true

        copyright.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:10).isActive = true
        copyright.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        copyright.topAnchor.constraint(equalTo: self.genre.bottomAnchor, constant: 10).isActive = true
        copyright.heightAnchor.constraint(equalToConstant:60).isActive = true
        copyright.text = album.copyright

        var genreStr:String = ""
        
            for each in  album.genres  {
                genreStr += String("\(each.name), ")
            }
        genreStr.removeLast(2)
        genre.text = genreStr
        
        
        iTunesButton.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:20).isActive = true
        iTunesButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        iTunesButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        iTunesButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        iTunesButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        iTunesButton.setTitle("Open in iTunes", for: .normal)
        iTunesButton.addTarget(self, action: #selector(openWithiTunes), for:.touchUpInside)
        iTunesButton.isHidden = false
    }
    
    private let albumImage : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x:0 , y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let albumName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let artistTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .right
        return lbl
    }()
    
    private let artistName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let releaseDateTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .right
        return lbl
    }()
    
    private let releaseDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let copyright : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.numberOfLines = 3
        return lbl
    }()
    
    private let genreTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .right
        return lbl
    }()
    
    private let genre : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let iTunesButton : UIButton = {
        let buttton = UIButton(type: .custom)
        buttton.backgroundColor = .gray
        buttton.setTitleColor(.white, for: .normal)
        buttton.layer.cornerRadius = 5.0
        return buttton
    }()
    
    func loadImage() {
        ServiceManager.shared.loadImage(with: URL(string: album?.imageURL ?? ""), completion: { (image) in
            DispatchQueue.main.async {
                self.albumImage.image = image
            }
        })
    }
    
    @objc func openWithiTunes() {
        guard let urlStr = album?.url else { return  }
        guard let url = URL(string: urlStr) else { return  }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}
