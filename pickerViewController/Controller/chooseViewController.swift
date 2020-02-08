//
//  chooseViewController.swift
//  pickerViewController
//
//  Created by Aaryan Kothari on 08/02/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var countries = [String]()
var Latitudes = [Double]()
var Longitudes = [Double]()
var imgCodes = [String]()


class chooseViewController: UIViewController {
    
    //Variables
    var lat = Double()
    var lon = Double()
    var country = String()
    var y = String()
    var count = Int()

    override func viewDidLoad() {
        
    super.viewDidLoad()
    
    setNavigationBarProperties()
    
    getData(url: "https://restcountries.eu/rest/v2/all")
    }
    
    
    //JSON stuff
    func getData(url: String) {
        
    Alamofire.request(url, method: .get).responseJSON {
        response in
            if response.result.isSuccess {
                
                print("Success! Got the data")
                
                let bitJSON : JSON = JSON(response.result.value!)
                
                self.updateData(json: bitJSON)
            }
            else { print("Error \(String(describing: response.result.error))")  }
        }
    }
    
    func updateData(json : JSON) {
        
        count = json.count-1
        
        for i in  0...count {
            Latitudes.append(json[i]["latlng"][0].doubleValue)
            
            Longitudes.append(json[i]["latlng"][1].doubleValue)
            
            countries.append(json[i]["name"].stringValue)
            
            imgCodes.append(json[i]["alpha2Code"].stringValue.lowercased())
        }
        print(countries)
     }
    
    
    @IBAction func pickerSelected(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController
        
        
        //pass Data b/w viewcontrollers
        vc?.lat = lat
        
        vc?.lon = lon
        
        vc?.country = country
        
        //vc?.countries = countries
        
        //vc?.Latitudes = Latitudes
        
        //vc?.Longitudes = Longitudes
                
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func tableSelected(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         
         let vc = storyboard.instantiateViewController(identifier: "tblViewController") as? tblViewController
         
         //pass Data b/w viewcontrollers
         vc?.lat = lat
         
         vc?.lon = lon
         
         vc?.country = country
         
        //  vc?.countries = countries
         
        //  vc?.Latitudes = Latitudes
         
        //  vc?.Longitudes = Longitudes
                 
        //  self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    //Customise Navigation Bar
    func setNavigationBarProperties(){
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 200/255, green: 240/255, blue: 230/255, alpha: 1.0)
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    
    
    
}
