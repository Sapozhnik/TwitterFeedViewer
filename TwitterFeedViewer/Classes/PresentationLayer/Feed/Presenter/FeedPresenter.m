//
//  FeedPresenter.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedPresenter.h"

#import "FeedViewInput.h"
#import "FeedInteractorInput.h"
#import "FeedRouterInput.h"

// Entities
#import "Tweet.h"

@interface FeedPresenter ()

@property (nonatomic, strong) NSMutableArray *tweets;

@end

@implementation FeedPresenter

- (void)refreshFeed {
    [self.interactor loadTweetsWithQuery:self.searchQuery
                                   count:[self.searchQueryPageSize unsignedIntegerValue]
                                 afterId:nil];
}

#pragma mark - Методы FeedModuleInput

#pragma mark - Методы FeedViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self refreshFeed];
}

- (void)loadFreshTweets {
    [self refreshFeed];
}

- (void)loadMoreTweets {
    Tweet *lastTweet = self.tweets.lastObject;
    NSString *lastTweetId = lastTweet.tweetId;
    [self.interactor loadTweetsWithQuery:self.searchQuery
                                   count:[self.searchQueryPageSize unsignedIntegerValue]
                                 afterId:lastTweetId];
}

- (void)didSelectTweetAtIndex:(NSUInteger)tweetIndex {
    if (self.tweets.count > tweetIndex) {
        Tweet *selectedTweet = self.tweets[tweetIndex];
        [self.router openTweetDetailModuleWithTweet:selectedTweet];
    }
}

#pragma mark - Методы FeedInteractorOutput

- (void)didLoadTweets:(NSArray<Tweet *> *)tweets
              afterId:(NSString *)afterId {
    [self.view hideSpinners];
    
    if (afterId != nil) {
        Tweet *lastTweet = self.tweets.lastObject;
        NSString *lastTweetId = lastTweet.tweetId;
        if ([afterId isEqualToString:lastTweetId]) { //infinite scroll
            [self.tweets addObjectsFromArray:tweets];
            [self.view addTweets:tweets
                 withAuthorPhoto:YES];
        }
    } else {
        //pull to refresh or initial
        self.tweets = [tweets mutableCopy];
        [self.view showTweets:tweets
              withAuthorPhoto:YES];
    }
}

@end
