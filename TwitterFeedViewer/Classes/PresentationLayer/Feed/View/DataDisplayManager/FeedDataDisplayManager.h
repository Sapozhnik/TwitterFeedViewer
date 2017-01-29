//
//  FeedDataDisplayManager.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Tweet;
@class TweetCellObjectFactory;

@protocol FeedDataDisplayManagerDelegate;

@interface FeedDataDisplayManager : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<FeedDataDisplayManagerDelegate> delegate;

@property (nonatomic, strong) TweetCellObjectFactory *cellObjectFactory;

- (void)showTweets:(NSArray<Tweet *> *)tweets
   withAuthorPhoto:(BOOL)showAuthorPhoto;

@end
