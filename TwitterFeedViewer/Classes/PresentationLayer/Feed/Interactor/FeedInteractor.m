//
//  FeedInteractor.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedInteractor.h"

#import "FeedInteractorOutput.h"

#import "Tweet.h"

// Dependencies
#import "TweetServiceProtocol.h"
#import "SettingsServiceProtocol.h"

@implementation FeedInteractor

#pragma mark - Методы FeedInteractorInput

- (void)loadTweetsWithQuery:(NSString *)query
                      count:(NSUInteger)count
                    afterId:(NSString *)afterId {
    
    __weak typeof(self) wSelf = self;

    [self.tweetService loadTweetsWithQuery:query
                                     count:count
                                   afterId:afterId
                           complitionBlock:^(NSArray<Tweet *> *tweets, NSError *error) {
                               [wSelf.output didLoadTweets:tweets
                                                   afterId:afterId];
                           }];
}

- (void)checkFreshTweetsWithQuery:(NSString *)query
                            count:(NSUInteger)count
                         beforeId:(NSString *)newestTweetId {
    __weak typeof(self) wSelf = self;
    
    [self.tweetService loadTweetsWithQuery:query
                                     count:count
                                   afterId:nil
                           complitionBlock:^(NSArray<Tweet *> *tweets, NSError *error) {
                               Tweet *firstTweet = tweets.firstObject;
                               
                               BOOL hasNewTweets = (error == nil) && (firstTweet != nil) && ([firstTweet.tweetId isEqualToString:newestTweetId] == NO);
                               
                               if (hasNewTweets == YES) {
                                   [wSelf.output discoveredFreshTweets];
                               }
                           }];
}

- (BOOL)obtainShowUsersPhotoFlag {
    return [self.settingsService shouldShowUsersPhoto];
}

@end
