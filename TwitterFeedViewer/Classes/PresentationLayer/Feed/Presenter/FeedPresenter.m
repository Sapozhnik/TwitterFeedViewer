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

@implementation FeedPresenter

- (void)refreshFeed {
    [self.interactor loadTweetsWithQuery:self.searchQuery
                                   count:[self.searchQueryPageSize unsignedIntegerValue]
                                 afterId:nil];
}

#pragma mark - Методы FeedModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы FeedViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self refreshFeed];
}

- (void)loadFreshTweets {
    [self refreshFeed];
}

- (void)loadMoreTweets {
    
}

#pragma mark - Методы FeedInteractorOutput

- (void)didLoadTweets:(NSArray<Tweet *> *)tweets afterId:(NSString *)afterId {
    [self.view hideSpinners];
    [self.view showTweets:tweets
          withAuthorPhoto:YES];
    
    NSLog(@"%@", tweets);
}

@end
