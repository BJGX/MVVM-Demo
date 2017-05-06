//
//  HomeViewController.swift
//  MVVM-Demo
//
//  Created by tembin on 2017/5/6.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var array = [MovieModel]()
  var tableView: UITableView!

  override func viewDidLoad() {
      super.viewDidLoad()

    setUI()
  }

  func setUI() {
    self.title = "电影首页"
    
    tableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height), style: .plain)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 80
    self.view.addSubview(tableView)
    tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "Cell")

    let model = MovieViewModel()
    model.getData { [weak self] (dataArray) in
      self!.array = dataArray
      self!.tableView.reloadData()
    }
  }
}

extension HomeViewController: UITableViewDataSource,UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieCell
    cell.model = array[indexPath.row]
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movieModel = MovieViewModel()
    movieModel.movieDetailWithPublicModel(movieModel: array[indexPath.row], superController: self)
  }
}





