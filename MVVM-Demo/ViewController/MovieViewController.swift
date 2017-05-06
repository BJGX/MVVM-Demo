//
//  MovieViewController.swift
//  MVVM-Demo
//
//  Created by tembin on 2017/5/6.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
  
  
  var url = ""
  

    override func viewDidLoad() {
        super.viewDidLoad()

      let webView = UIWebView(frame: self.view.bounds)
      let urlRequest = URLRequest(url: URL(string: url)!)
      webView.loadRequest(urlRequest)
      self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
