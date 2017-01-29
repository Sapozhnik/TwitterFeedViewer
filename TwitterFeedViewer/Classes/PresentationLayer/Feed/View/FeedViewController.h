//
//  FeedViewController.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FeedViewInput.h"

// Delegates
#import "FeedDataDisplayManagerDelegate.h"

@class FeedDataDisplayManager;

@protocol FeedViewOutput;

@interface FeedViewController : UIViewController <FeedViewInput, FeedDataDisplayManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *bubbleButton;
@property (nonatomic ,weak) IBOutlet NSLayoutConstraint *topBubbleButtonConstraint;

@property (nonatomic, strong) id<FeedViewOutput> output;

@property (nonatomic, strong) FeedDataDisplayManager *dataDisplayManager;

- (IBAction)settingsButtonDidTap:(id)sender;
- (IBAction)bubbleDidTap:(id)sender;

@end
