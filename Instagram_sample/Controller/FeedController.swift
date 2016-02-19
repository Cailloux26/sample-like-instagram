//
//  FeedController.swift
//  Instagram_sample
//
//  Created by koichi tanaka on 2/17/16.
//  Copyright © 2016 koichi tanaka. All rights reserved.
//

import UIKit

class FeedController: UITableViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData() // Refreshes the data.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let feed = Post.feed {
            return feed.count
        } else {
            return 0
        }
    }
    
    func postIndex(cellIndex: Int) -> Int {
        print(tableView.numberOfSections)
        return tableView.numberOfSections - cellIndex - 1
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let post = Post.feed![postIndex(section)]
        let headerCell = tableView.dequeueReusableCellWithIdentifier("PostHeaderCell") as? PostHeaderCell
        if post.creator == Profile.currentUser?.username {
            headerCell!.profilePicture.image = Profile.currentUser?.picture
        } else {
            // set to creator's image
        }
        headerCell?.usernameButton.setTitle(post.creator, forState: .Normal)
        return headerCell
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = Post.feed![postIndex(indexPath.section)]
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        cell.captionLabel.text = post.caption
        cell.imgView.image = post.image
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let post = Post.feed![postIndex(indexPath.section)]
        if let img = post.image {
            let aspectRatio = img.size.height / img.size.width
            return tableView.frame.size.width * aspectRatio + 80
        }
        return 208 // default height
    }
    
}
