//
//  FeedRouterInput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tweet;

@protocol FeedRouterInput <NSObject>

- (void)openTweetDetailModuleWithTweet:(Tweet *)tweet;

@end
