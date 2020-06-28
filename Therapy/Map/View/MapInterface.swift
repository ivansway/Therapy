//
//  MapInterface.swift
//  Therapy
//
//  Created by Ivan Myrza on 20/06/2020.
//  Copyright © 2020 Ivan Myrza. All rights reserved.
//

import UIKit

class MapInterface: NSObject, UITableViewDelegate, UITableViewDataSource, MapNetworkDelegate {
    
    private var predictions: [Predictions] = []
    
    // INSTANCE
    var network: MapNetworkManager?
    private var superView: UIView?
//    var map: Map?
    var mapVM: MapViewModel?
    
    private var tableView: UITableView? = UITableView()
    
    // DLEGATE
    func passJsonBase(value: JsonBase) {
        self.predictions = value.predictions ?? predictions
        
        // RELAOD TABLE VIEW
        DispatchQueue.main.async {
            self.tableView!.reloadData()
        }
    }

    init(superView: UIView) {
        self.superView = superView
    }
    
    // TF
    var searchTF: UITextField? = UITextField()

    // SEARCH TF
    func searchTextField() {
        
        // BACK
        let back = UIView()
        back.removeFromSuperview()
        back.layer.cornerRadius = 12
        back.backgroundColor = .white
        Constraints.heightLeadingTrailingTop(superView: superView!, view: back, heightAnchor: 46, leadingAnchor: 24, trailingAnchor: -24, topAnchor: superView!.frame.height / 10)
        
        
        searchTF?.placeholder = "Search"
        searchTF?.textAlignment = .left
        searchTF?.isUserInteractionEnabled = true
        searchTF?.addTarget(self, action: #selector(dropTable(sender:)), for: .allEditingEvents)
        searchTF?.font = UIFont(name: "Optima", size: 18)
        Constraints.heightLeadingTrailingTop(superView: back, view: searchTF!, heightAnchor: 46, leadingAnchor: 16, trailingAnchor: -16, topAnchor: 0)
        
        self.network = MapNetworkManager()
        self.network?.delegate = self
    }
    
    @objc func dropTable(sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        // AUTO COMPLETE
        self.network?.autoComplete(text: text)
        
        DispatchQueue.main.async {
            if text.count >= 1 {
                self.tableView!.register(PlaceCell.self, forCellReuseIdentifier: "PlaceCell")
                self.tableView!.delegate = self
                self.tableView!.dataSource = self
                self.tableView!.isHidden = false
                self.tableView!.layer.cornerRadius = 12
                Constraints.heightLeadingTrailingTop(superView: self.superView!, view: self.tableView!, heightAnchor: 176, leadingAnchor: 24, trailingAnchor: -24, topAnchor: self.superView!.frame.height / 6.02)
            } else {
                self.tableView!.isHidden = true
            }
        }
    }

    // TABLE DELEGATE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return predictions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        
        if let description = self.predictions[indexPath.row].description {
            cell.textLabel?.text = description
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.network?.placeDetail(placeID: self.predictions[indexPath.row].place_id ?? "")
        tableView.isHidden = true
    }
}
