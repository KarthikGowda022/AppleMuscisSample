//
//  ViewController.swift
//  AppleMusicSample
//
//  Created by Karthik Shyadanhalli Madeve Gowda on 2/28/20.
//  Copyright © 2020 Karthik Shyadanhalli Madeve Gowda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView :UITableView = UITableView.init(frame: UIScreen.main.bounds, style: .grouped)
    
    var albumList: [Album]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(AlbumCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.allowsMultipleSelection = false
        loadDataFromRSSFeed()
    }

    func addAutolayoutConstraints() {
        
    }
    
    func loadDataFromRSSFeed() {
        
        ServiceManager.shared.fetchTopTenAlbums { (list) in
            print(list)
            DispatchQueue.main.async {
                self.albumList = list.feed.result
                self.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? AlbumCell{
            cell.album =  albumList?[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailView()
        detailVC.album = albumList?[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
