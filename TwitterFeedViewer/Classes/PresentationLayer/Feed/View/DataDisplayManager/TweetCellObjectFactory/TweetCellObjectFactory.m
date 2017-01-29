//
//  TweetCellObjectFactory.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "TweetCellObjectFactory.h"

// Entities
#import "TweetCellObject.h"
#import "Tweet.h"
#import "User.h"

@implementation TweetCellObjectFactory

- (NSArray<TweetCellObject *> *)tweetCellObjectsFromTweets:(NSArray<Tweet *> *)tweets
                                     shouldShowAuthorPhoto:(BOOL)shouldShowAuthorPhoto {
    NSMutableArray *result = [NSMutableArray new];
    for (Tweet *tweet in tweets) {
        TweetCellObject *tweetCellObject = [TweetCellObject new];
        tweetCellObject.text = tweet.text;
        tweetCellObject.date = [NSDateFormatter localizedStringFromDate:tweet.date
                                                              dateStyle:NSDateFormatterShortStyle
                                                              timeStyle:NSDateFormatterShortStyle];
        tweetCellObject.authorName = tweet.user.name;
        tweetCellObject.profileImageURL = tweet.user.profileImageURL;
        tweetCellObject.showImage = shouldShowAuthorPhoto;
        [result addObject:tweetCellObject];
    }
    return [result copy];
}

@end
