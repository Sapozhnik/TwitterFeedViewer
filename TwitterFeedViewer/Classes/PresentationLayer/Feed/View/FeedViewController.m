//
//  FeedViewController.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedViewController.h"

#import "FeedViewOutput.h"

// Dependencies
#import "FeedDataDisplayManager.h"

@implementation FeedViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

    self.tableView.dataSource = self.dataDisplayManager;
    self.tableView.delegate = self.dataDisplayManager;
    
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - FeedViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
}

- (void)showTweets:(NSArray<Tweet *> *)tweets
   withAuthorPhoto:(BOOL)showAuthorPhoto {
    [self.dataDisplayManager showTweets:tweets
                        withAuthorPhoto:showAuthorPhoto];
    [self.tableView reloadData];
}

#pragma mark - FeedDataDisplayManagerDelegate

- (void)didTapOnTweetWithIndex:(NSUInteger)tweetIndex {
    
}

@end
