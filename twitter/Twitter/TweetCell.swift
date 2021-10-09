//
//  TweetCell.swift
//  Twitter
//
//  Created by Frank Choukouali on 9/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    var favorited:Bool = false
    var TweetId:Int = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setFavortite(_ isFavorited: Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: TweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting")
        })
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: TweetId, success: {
                self.setFavortite(true)
            }, failure: { (error) in
                print("Favorite did not succeed")
            })
        }else{
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: TweetId, success: {
                self.setFavortite(false)
            }, failure: { (error) in
                print("UnFavorite did not succeed")
            })
        }
        
    }
    func setRetweeted(_ isRetweeted: Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled  = false
        }else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled  = true
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
