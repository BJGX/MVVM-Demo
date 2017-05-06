//
//  MovieViewModel.swift
//  MVVM-Demo
//
//  Created by tembin on 2017/5/6.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieViewModel: NSObject {
  
  func getData(complete:@escaping (_ array: [MovieModel]) -> Void) {
  
    let url = HEAD_URL + "/v2/movie/coming_soon"
    
    Alamofire.request(url, method: .post).responseJSON { (response) in

      if let data = response.result.value {
        let json =  JSON(data)
        var array = [MovieModel]()
        let subjects = json["subjects"].arrayValue
        
        for subject in subjects {
          let model = MovieModel()
          model.movieName = subject["title"].stringValue
          model.year = subject["year"].stringValue
          model.imageUrl = subject["images"]["medium"].stringValue
          model.detailUrl = subject["alt"].stringValue
          array.append(model)
        }
        complete(array)
      }
      else {
        print(response.error)
      }

    }
  }
  
  func movieDetailWithPublicModel(movieModel: MovieModel, superController: UIViewController)  {
    let movieVC = MovieViewController()
    movieVC.url = movieModel.detailUrl
    superController.navigationController?.pushViewController(movieVC, animated: true)
  }
}
