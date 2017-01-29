//
//  DetailTweetViewController.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailTweetViewInput.h"

@protocol DetailTweetViewOutput;

@interface DetailTweetViewController : UIViewController <DetailTweetViewInput>

@property (nonatomic, strong) id<DetailTweetViewOutput> output;

@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *authorImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;

@end
