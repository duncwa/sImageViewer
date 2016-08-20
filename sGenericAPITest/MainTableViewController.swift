//
//  MainTableViewController.swift
//  sGenericAPITest
//
//  Created by Duncan Wallace on 3/9/16.
//  Copyright © 2016 Duncan Wallace. All rights reserved.
//

import UIKit
import Photos

class MainTableViewController: UITableViewController, NSCopying {

  //MARK: - Properties
  
  let kPhotosURL:String = "http://jsonplaceholder.typicode.com/photos"
  let photoCellIdentifier = "photoViewCell"
  var json: [[String: AnyObject]] = []

  var photos = Photos(albumId: "9", photoId: "999", title: "title", url: "http://duncwa.com", thumbnailUrl: "http://duncwa.com/picture")
  var data: NSMutableArray = []
  var photosArray: [[String: AnyObject]] = []
  var photosDictionary: Dictionary <String, AnyObject> = [:]
  var imageUrl: URL!
  var image: UIImage!

  //MARK: - Initialization
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
      // Get data from file/network/other in background
      self.fetchedData()
    }
  }
  
  // Generic form
  /*  DispatchQueue.global().async {
      
      // Background Thread
      // // qos' default value is ´DispatchQoS.QoSClass.default`
      
      DispatchQueue.main.async {
        // Run UI Updates
      }
    }
  */

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
      // return the number of sections
      return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return the number of rows
      return photosArray.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      return photoCellAtIndexPath(indexPath)
  }

  func photoCellAtIndexPath(_ indexPath:IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: photoCellIdentifier) as! PhotoViewCell
      //print("3 of 3 - cellForRowAtIndexPath")
    
      self.photosDictionary = (photosArray[(indexPath as NSIndexPath).row] as [String: AnyObject])
      if let result_number = self.photosDictionary["id"]! as? NSNumber
      {
        self.photos.photoId = "\(result_number)"
      }
      if let result_string = self.photosDictionary["thumbnailUrl"]! as? String
      {
        self.photos.thumbnailUrl = "\(result_string)"
      }
      if let result_string = self.photosDictionary["title"]! as? String
      {
        self.photos.title = "\(result_string)"
      }
    
      cell.title.text = self.photos.title as String
      //cell.photoCount.text = String(format: "%d", indexPath.row)
  
      let url: String = self.photos.thumbnailUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

      self.imageUrl = URL(string: url)
      imageGet(self.imageUrl, index: indexPath)
      cell.photoCount.text = String(format: "%d", (indexPath as NSIndexPath).row)
      return cell
  }
  
  // MARK: - Get image from URL for tableview

  func imageGet(_ urlImage: URL, index: IndexPath) {
      let task = URLSession.shared.dataTask(with: urlImage, completionHandler: {data, response, error -> Void in
      if (data != nil) {
      self.image = UIImage(data: data!)!
        if (self.image != nil) {
          DispatchQueue.main.async(execute: {
            if let updateCell = self.tableView?.cellForRow(at: index) as? PhotoViewCell {
              updateCell.photoImage.image = self.image
            }
          })
        }
    
      } else {
        print("An image retrieval error occurred")
      }
    })
  
    task.resume()
  }

  // MARK: - Deep copy of a pass by reference object
  
  func copy(with zoneCopy: NSZone?) -> AnyObject {
      let copy = self.json
      return copy
  }

  // MARK: - Asynchronous data fetch in background

  func fetchedData() {
      let requestURL: URL = URL(string: "http://jsonplaceholder.typicode.com/photos")!
      //let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL)
      //let session = URLSession.shared
      let request = URLRequest(url: requestURL)
      let task = URLSession.shared.dataTask(with: request) {
        (data, response, error) -> Void in

      let httpResponse = response as! HTTPURLResponse
      let statusCode = httpResponse.statusCode

      if (statusCode == 200) {
        //print("1 of 3 - Files downloaded successfully.")
      }
      
      if (statusCode == 200) {
       
        do {
          self.json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [[String:AnyObject]]
          self.photosArray = self.copy() as! [[String : AnyObject]]
          DispatchQueue.main.async(execute: { () -> Void in
            self.tableView.reloadData()
            //print("2 of 3 - self.tableView.reloadData")
          })
        } catch {
          print("Error with Json: \(error)")
        }
        self.tableView.reloadData()
        //print("2 of 3 - self.tableView.reloadData")
      }
    
    }
    task.resume()
  
  }

}
