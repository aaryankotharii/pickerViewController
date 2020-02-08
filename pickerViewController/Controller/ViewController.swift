//
//  ViewController.swift
//  pickerViewController
//
//  Created by Aaryan Kothari on 07/02/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //Outlets
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //Variables
   // var countries = [String]()
  //  var Latitudes = [Double]()
    //var Longitudes = [Double]()
    var lat = Double()
    var lon = Double()
    var country = String()
    var y = String()
    var count = Int()
    
    override func viewDidLoad() {
        
    super.viewDidLoad()
        
    pickerView.dataSource = self
        
    pickerView.delegate = self
    
    countryLabel.text = ""
        
    print(countries,"countries")
        DispatchQueue.main.async {
            self.pickerView.reloadAllComponents()
        }
    }
    
    
    //PickerView Delegate Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
     }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        country = countries[row]
        
        countryLabel.text = "\(country)"
        
        lat = Latitudes[row]
        
        lon = Longitudes[row]
    }

    
    
    
    @IBAction func goToMaps(_ sender: Any) {
        // Prepare for segue
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mapViewController") as? mapViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        //pass Data b/w viewcontrollers
        vc?.lat = lat
        
        vc?.lon = lon
        
        vc?.country = country
        }
}

