//
//  DetailTweetViewController.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "DetailTweetViewController.h"

#import "DetailTweetViewOutput.h"

// Entities
#import "Tweet.h"
#import "User.h"

// Libraries
#import <SDWebImage/UIImageView+WebCache.h>

@implementation DetailTweetViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы DetailTweetViewInput

- (void)setupInitialStateWithTweet:(Tweet *)tweet{
    self.authorNameLabel.text = tweet.user.name;
    
    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:tweet.date
                                                         dateStyle:NSDateFormatterShortStyle
                                                         timeStyle:NSDateFormatterShortStyle];
    self.tweetTextLabel.text = tweet.text;
    [self.authorImage sd_setImageWithURL:tweet.user.profileImageURL];
}

@end
