//
//  Photos.swift
//  sGenericAPITest
//
//  Created by Duncan Wallace on 3/10/16.
//  Copyright © 2016 Duncan Wallace. All rights reserved.
//

import UIKit

class Photos {
  var albumId: String
  var photoId: String
  var title: String
  var url: String
  var thumbnailUrl: String
  
  init(albumId: String, photoId: String, title: String, url: String, thumbnailUrl: String) {
    self.albumId = albumId
    self.photoId = photoId
    self.title = title
    self.url = url
    self.thumbnailUrl = thumbnailUrl
  }
}
