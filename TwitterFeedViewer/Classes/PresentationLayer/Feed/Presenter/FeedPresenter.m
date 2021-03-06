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

@property (nonatomic, strong) NSTimer *updateTimer;

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
    [self refreshFeed];
}

- (void)viewWillAppear {
    NSTimeInterval timerTimeInterval = [self.updateTimeInterval doubleValue];
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:timerTimeInterval
                                                        target:self
                                                      selector:@selector(checkFreshTweets)
                                                      userInfo:nil
                                                       repeats:YES];
}

- (void)viewWillDisappear {
    [self.updateTimer invalidate];
    self.updateTimer = nil;
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

- (void)settingsButtonDidTap {
    [self.router openSettingsModuleWithModuleOutput:self];
}

- (void)bubleTapped {
    [self refreshFeed];
}

#pragma mark - Методы FeedInteractorOutput

- (void)didLoadTweets:(NSArray<Tweet *> *)tweets
              afterId:(NSString *)afterId {
    [self.view hideSpinners];
    [self.view setBubbleOpenState:NO];

    BOOL shouldShowPhoto = [self.interactor obtainShowUsersPhotoFlag];
    
    if (afterId != nil) {
        Tweet *lastTweet = self.tweets.lastObject;
        NSString *lastTweetId = lastTweet.tweetId;
        if ([afterId isEqualToString:lastTweetId]) { //infinite scroll
            [self.tweets addObjectsFromArray:tweets];
            [self.view addTweets:tweets
                 withAuthorPhoto:shouldShowPhoto];
        }
    } else {
        //pull to refresh or initial
        self.tweets = [tweets mutableCopy];
        [self.view showTweets:tweets
              withAuthorPhoto:shouldShowPhoto];
        [self.view scrollToTop];
    }
}

- (void)discoveredFreshTweets {
    [self.view setBubbleOpenState:YES];
}

#pragma mark - SettingsModuleOutput

- (void)settingsModuleWillClose {
    BOOL shouldShowPhoto = [self.interactor obtainShowUsersPhotoFlag];
    [self.view showTweets:self.tweets
          withAuthorPhoto:shouldShowPhoto];
}

#pragma mark - Timer

- (void)checkFreshTweets {
    Tweet *newestTweet = self.tweets.firstObject;
    
    [self.interactor checkFreshTweetsWithQuery:self.searchQuery
                                         count:1u
                                      beforeId:newestTweet.tweetId];
}

@end
