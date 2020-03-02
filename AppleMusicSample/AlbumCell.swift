//
//  AlbumCell.swift
//  AppleMusicSample
//
//  Created by Karthik Shyadanhalli Madeve Gowda on 2/28/20.
//  Copyright © 2020 Karthik Shyadanhalli Madeve Gowda. All rights reserved.
//

import Foundation
import UIKit

class AlbumCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        albumImage.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: 98, height: 98)
        addSubview(albumImage)
        addSubview(albumName)
        addSubview(artistName)
        
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumName.translatesAutoresizingMaskIntoConstraints = false
        artistName.translatesAutoresizingMaskIntoConstraints = false
        
        //albumImage.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        albumImage.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        albumImage.widthAnchor.constraint(equalToConstant:98).isActive = true
        albumImage.heightAnchor.constraint(equalToConstant:98).isActive = true
        albumImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        
        
        // albumImage.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        albumName.leadingAnchor.constraint(equalTo:self.albumImage.trailingAnchor, constant:10).isActive = true
        albumName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10).isActive = true
        albumName.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 10).isActive = true
        albumName.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        artistName.leadingAnchor.constraint(equalTo:self.albumImage.trailingAnchor, constant:10).isActive = true
        artistName.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10).isActive = true
        artistName.topAnchor.constraint(equalTo: self.albumName.bottomAnchor, constant: 0).isActive = true
        artistName.heightAnchor.constraint(equalToConstant:30).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
  
    }
    
    var album:Album? {
        didSet {
            ServiceManager.shared.loadImage(with: URL(string: album?.imageURL ?? ""), completion: { (image) in
                DispatchQueue.main.async {
                    self.albumImage.image = image
                }
            })
            albumName.text = album?.albumName
            artistName.text =  album?.artistName
        }
    }
    
    private let albumName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let artistName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.darkGray
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let albumImage : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x:0 , y: 0, width: 100, height: 100))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
}
