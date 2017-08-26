//
//  ShopsTableViewController.swift
//  URLPractice
//
//  Created by Vince Lee on 2017/8/26.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit

class ShopsTableViewController: UITableViewController {
    
    var shopsName: [String] = []
    var shopsAdress: [String] = []
    var wifi: [Double] = []
    var seat: [Double] = []
    var quiet: [Double] = []
    var tasty: [Double] = []
    var cheap: [Double] = []
    var music: [Double] = []
    var mrt: [String] = []
    var open_time: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes/taipei".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data, let dic = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
                
                // URLSession in background loading queue so need (DispatchQueue.main) make it to main queue
                DispatchQueue.main.async{
                    
                    
                for shop in dic {
                    self.shopsName.append(shop["name"] as! String)
                }
                for shop in dic {
                    self.shopsAdress.append(shop["address"] as! String)
                }
                for shop in dic {
                        self.wifi.append(shop["wifi"] as! Double)
                }
                for shop in dic {
                        self.seat.append(shop["seat"] as! Double)
                }
                    for shop in dic {
                        self.quiet.append(shop["quiet"] as! Double)
                    }
                    for shop in dic {
                        self.tasty.append(shop["tasty"] as! Double)
                    }
                    for shop in dic {
                        self.cheap.append(shop["cheap"] as! Double)
                    }
                    for shop in dic {
                        self.music.append(shop["music"] as! Double)
                    }
                    for shop in dic {
                        self.mrt.append(shop["mrt"] as! String)
                    }
                    for shop in dic {
                        self.open_time.append(shop["open_time"] as! String)
                    }
                    
                    
                    print(self.wifi)
                    self.tableView.reloadData()
                }
               
            }
        }
        task.resume()
        
    }
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }
            
            // MARK: - Table view data source
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailController = segue.destination as? DetailTableViewController
        if let row = tableView.indexPathForSelectedRow?.row {
            let shop:[Any] = [shopsName[row], shopsAdress[row], "\(wifi[row])", "\(seat[row])", "\(quiet[row])", "\(tasty[row])", "\(cheap[row])", "\(music[row])", mrt[row], open_time[row]]
            
            detailController?.shop = shop
        }
    }
            
            func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
                let shopName = shopsName[indexPath.row]
                let shopAddress = shopsAdress[indexPath.row]
                cell.textLabel?.text = shopName
                cell.detailTextLabel?.text = shopAddress
            }
            
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTitleLocation", for: indexPath)
                
                configure(cell: cell, forItemAt: indexPath)
                return cell
            }
            
            
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                // #warning Incomplete implementation, return the number of rows
                return shopsName.count
            }
}
            /*
             override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
             
             // Configure the cell...
             
             return cell
             }
             */
            
            /*
             // Override to support conditional editing of the table view.
             override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
             // Return false if you do not want the specified item to be editable.
             return true
             }
             */
            
            /*
             // Override to support editing the table view.
             override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
             if editingStyle == .delete {
             // Delete the row from the data source
             tableView.deleteRows(at: [indexPath], with: .fade)
             } else if editingStyle == .insert {
             // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
             }
             }
             */
            
            /*
             // Override to support rearranging the table view.
             override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
             
             }
             */
            
            /*
             // Override to support conditional rearranging of the table view.
             override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
             // Return false if you do not want the item to be re-orderable.
             return true
             }
             */
            
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destinationViewController.
             // Pass the selected object to the new view controller.
             }
             */
            


