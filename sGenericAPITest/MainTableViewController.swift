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

  var photos: Photos!
  var data: NSMutableArray = []
  var photosArray: [[String: AnyObject]] = []
  var photosDictionary: Dictionary <String, AnyObject> = [:]
  var imageUrl: NSURL!
  var image: UIImage!

  //MARK: - Initialization
  
  override func viewDidLoad() {
      super.viewDidLoad()

      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        // Get data from file/network/other in background
        self.fetchedData()
      }
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      // return the number of sections
      return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return the number of rows
      return photosArray.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
      return photoCellAtIndexPath(indexPath)
  }

  func photoCellAtIndexPath(indexPath:NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier(photoCellIdentifier) as! PhotoViewCell
      print("3 of 3 - cellForRowAtIndexPath")
    
      self.photosDictionary = (photosArray[indexPath.row] as [String: AnyObject])
   
      self.photos.albumId = self.photosDictionary["albumId"]!
      self.photos.thumbnailUrl = photosDictionary["thumbnailUrl"]!
      self.photos.title = photosDictionary["title"]!
     
      print(self.photos.albumId)
      print(self.photos.thumbnailUrl)
      print(self.photos.title)
      
      cell.textLabel?.text = self.photos.thumbnailUrl as? String
      
      let url: String = self.photos.thumbnailUrl.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!

      self.imageUrl = NSURL(string: url)
      imageGet(self.imageUrl, index: indexPath)
      cell.imageView!.image = self.image
      return cell
  }
  
  // MARK: - Get image from URL for tableview

  func imageGet(urlImage: NSURL, index: NSIndexPath) {
      let task = NSURLSession.sharedSession().dataTaskWithURL(urlImage, completionHandler: {data, response, error -> Void in
      if (data != nil) {
      self.image = UIImage(data: data!)!
      dispatch_async(dispatch_get_main_queue(), {
        let updateCell: PhotoViewCell = self.tableView.cellForRowAtIndexPath(index)! as! PhotoViewCell
        updateCell.imageView!.image = self.image
      
      })
    
      } else {
        print("An image retrieval error occurred")
      }
    })
  
    task.resume()
  }

  // MARK: - Deep copy of an object
  
  func copyWithZone(zoneCopy: NSZone) -> AnyObject {
      let copy = self.json
      return copy
  }

  // MARK: - Asynchronous data fetch in background

  func fetchedData() {
      let requestURL: NSURL = NSURL(string: "http://jsonplaceholder.typicode.com/photos")!
      let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
      let session = NSURLSession.sharedSession()
      let task = session.dataTaskWithRequest(urlRequest) {
        (data, response, error) -> Void in

      let httpResponse = response as! NSHTTPURLResponse
      let statusCode = httpResponse.statusCode

      if (statusCode == 200) {
        print("1 of 3 - Files downloaded successfully.")
      }
      
      if (statusCode == 200) {
       
        do {
          self.json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as! [[String:AnyObject]]
          self.photosArray = self.copy() as! [[String : AnyObject]]
          dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
            print("2 of 3 - self.tableView.reloadData")
          })
        } catch {
          print("Error with Json: \(error)")
        }
        self.tableView.reloadData()
        print("2 of 3 - self.tableView.reloadData")
      }
    
    }
    task.resume()
  
  }

}
