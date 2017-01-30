//
//  FeedViewInput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tweet;

@protocol FeedViewInput <NSObject>

- (void)showTweets:(NSArray<Tweet *> *)tweets
   withAuthorPhoto:(BOOL)showAuthorPhoto;

- (void)addTweets:(NSArray<Tweet *> *)tweets
  withAuthorPhoto:(BOOL)showAuthorPhoto;

- (void)hideSpinners;

- (void)setBubbleOpenState:(BOOL)openState;

- (void)scrollToTop;

@end
