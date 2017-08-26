//
//  ViewController.swift
//  URLPractice
//
//  Created by Vince Lee on 2017/8/24.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shops: [String] = []
    
    
    @IBOutlet weak var URLImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes/taipei".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data, let dic = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
                for shop in dic {
                    self.shops.append(shop["name"] as! String)
                    
                    
                }
                print(self.shops)
            }
//
//            if let data = data, let content = String(data: data, encoding: .utf8) {
//
//
//
//               print(content)
//                }
        }
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

