//
//  PostModel.swift
//  Instagram_sample
//
//  Created by koichi tanaka on 2/17/16.
//  Copyright © 2016 koichi tanaka. All rights reserved.
//

import UIKit

class Post {
    let creator:String
    let timestamp:NSData
    let image:UIImage?
    let caption:String?
    static var feed:Array<Post>?
    
    init(creator:String, image:UIImage?, caption:String?) {
        self.creator = creator
        self.image = image
        self.caption = caption
        timestamp = NSData()
    }
}

class PostCell: UITableViewCell {
    @IBOutlet weak var captionLabel:UILabel!
    @IBOutlet weak var imgView:UIImageView!
}

class PostHeaderCell: UITableViewCell {
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var usernameButton: UIButton!
}
