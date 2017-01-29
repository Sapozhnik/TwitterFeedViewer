//
//  FeedInteractorOutput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tweet;

@protocol FeedInteractorOutput <NSObject>

- (void)didLoadTweets:(NSArray<Tweet *> *)tweets
              afterId:(NSString *)afterId;

@end
