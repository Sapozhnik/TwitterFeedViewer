//
//  FeedViewController.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FeedViewInput.h"

@protocol FeedViewOutput;

@interface FeedViewController : UIViewController <FeedViewInput>

@property (nonatomic, strong) id<FeedViewOutput> output;

@end
