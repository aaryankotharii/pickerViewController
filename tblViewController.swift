//
//  tblViewController.swift
//  pickerViewController
//
//  Created by Aaryan Kothari on 08/02/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import UIKit

class tblViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    @IBOutlet weak var tableView: UITableView!
    
    
     // var countries = [String]()
     // var Latitudes = [Double]()
    //var Longitudes = [Double]()
      var lat = Double()
      var lon = Double()
      var country = String()
      var count = Int()
        

    var abc = ["A","B","C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(imgCodes)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let vc = storyboard.instantiateViewController(identifier: "chooseViewController") as? chooseViewController
//
//        countries = vc!.countries
        
        cell?.countryLabel.text = countries[indexPath.row]
        cell?.countryImage.image = UIImage(named: imgCodes[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        country = countries[indexPath.row]
                        
        lat = Latitudes[indexPath.row]
        
        lon = Longitudes[indexPath.row]

        // Prepare for segue
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mapViewController") as? mapViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        //pass Data b/w viewcontrollers
        vc?.lat = lat
        
        vc?.lon = lon
        
        vc?.country = country
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
