//
//  ViewController.swift
//  SectionInTableView
//
//  Created by Mahesh Prasad on 21/05/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import UIKit

class MobileBreand {
    var brandName: String?
    var modelname: [String]?
    
    init(brandName: String, modelName: [String]) {
        self.brandName = brandName
        self.modelname = modelName
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var mobileBrand = [MobileBreand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileBrand.append(MobileBreand.init(brandName: "Apple", modelName: ["iphone 5s","iphone 6","iPhone 7+","iPhone 11","iPhone 11 Pro"]))

        mobileBrand.append(MobileBreand.init(brandName: "Samsung", modelName: ["Samsung M Series","Samsung Galaxy Note 9","Samsung Galaxy Note 9+","Samsung Galaxy Note 10","Samsung Galaxy Note 10+"]))
        mobileBrand.append(MobileBreand.init(brandName: "Mi", modelName: ["Mi Note 7","Mi Note 7 Pro","Mi k20"]))
        mobileBrand.append(MobileBreand.init(brandName: "Huawei", modelName: ["Huawei Mate 20","Huawei P30 Pro","Huawei P10 Plus","Huawei p20"]))
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mobileBrand[indexPath.section].modelname?[indexPath.row]
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mobileBrand.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobileBrand[section].modelname?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mobileBrand[section].brandName
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        view.backgroundColor = .red
        
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.text = mobileBrand[section].brandName
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

