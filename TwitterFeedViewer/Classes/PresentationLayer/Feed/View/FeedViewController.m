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

static NSUInteger const TableViewEstimatedRowHeight = 150.0;

@interface FeedViewController ()

@property (nonatomic, strong) UIRefreshControl *pullToRefreshControl;

@end

@implementation FeedViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self.dataDisplayManager;
    self.tableView.delegate = self.dataDisplayManager;
    
    self.tableView.estimatedRowHeight = TableViewEstimatedRowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.pullToRefreshControl = [UIRefreshControl new];
    
    [self.pullToRefreshControl addTarget:self
                                  action:@selector(pullToRefreshControlValueChanged)
                        forControlEvents:UIControlEventValueChanged];
    if ([self.tableView respondsToSelector:@selector(setRefreshControl:)]) {
        self.tableView.refreshControl = self.pullToRefreshControl;
    } else {
        [self.tableView addSubview:self.pullToRefreshControl];
    }
    
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

- (void)hideSpinners {
    if (self.pullToRefreshControl.isRefreshing) {
        [self.pullToRefreshControl endRefreshing];
    }
}

#pragma mark - FeedDataDisplayManagerDelegate

- (void)didTapOnTweetWithIndex:(NSUInteger)tweetIndex {
    
}

#pragma mark - UIRefreshControl

- (void)pullToRefreshControlValueChanged {
    [self.output loadFreshTweets];
}

@end
