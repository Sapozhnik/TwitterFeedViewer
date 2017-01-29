//
//  TweetCellObjectFactory.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TweetCellObject;
@class Tweet;

@interface TweetCellObjectFactory : NSObject

- (NSArray<TweetCellObject *> *)tweetCellObjectsFromTweets:(NSArray<Tweet *> *)tweets
                                     shouldShowAuthorPhoto:(BOOL)shouldShowAuthorPhoto;

@end
