//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Kumara Prasad on 25/07/18.
//  Copyright © 2018 Matrix. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Storm Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                //this picture has to load
                pictures.append(item)
                print(pictures)
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //loading detailViewController
        if let vc =  storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            
            //Selected Image property
            vc.selectedImage = pictures[indexPath.row]
            
            //Navigation Controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

