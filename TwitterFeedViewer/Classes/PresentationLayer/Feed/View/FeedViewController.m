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
static NSUInteger const TableViewFooterHeight = 50.0;

@interface FeedViewController ()

@property (nonatomic, strong) UIRefreshControl *pullToRefreshControl;
@property (nonatomic, strong) UIView *infiniteScrollView;
@property (nonatomic, strong) UIActivityIndicatorView *infiniteScrollActivityIndicatorView;

@end

@implementation FeedViewController

- (void)addPullToRefreshControl {
    self.pullToRefreshControl = [UIRefreshControl new];
    
    [self.pullToRefreshControl addTarget:self
                                  action:@selector(pullToRefreshControlValueChanged)
                        forControlEvents:UIControlEventValueChanged];
    if ([self.tableView respondsToSelector:@selector(setRefreshControl:)]) {
        self.tableView.refreshControl = self.pullToRefreshControl;
    } else {
        [self.tableView addSubview:self.pullToRefreshControl];
    }
}

- (UIView *)infiniteScrollView {
    if (_infiniteScrollView != nil) {
        return _infiniteScrollView;
    } else {
        CGRect infiniteScrollViewFrame = CGRectMake(0.0,
                                                    0.0,
                                                    CGRectGetWidth(self.tableView.bounds),
                                                    TableViewFooterHeight);
        UIView *infiniteScrollView = [[UIView alloc] initWithFrame:infiniteScrollViewFrame];
        
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0,
                                                                                                                   0.0,
                                                                                                                   36.0,
                                                                                                                   36.0)];
        activityIndicatorView.color = [UIColor lightGrayColor];
        [infiniteScrollView addSubview:activityIndicatorView];
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        self.infiniteScrollActivityIndicatorView = activityIndicatorView;
        
        NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:activityIndicatorView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:infiniteScrollView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                            multiplier:1.0
                                                                              constant:0.0];
        [infiniteScrollView addConstraint:xCenterConstraint];
        
        NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:activityIndicatorView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:infiniteScrollView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1.0
                                                                              constant:0.0];
        [infiniteScrollView addConstraint:yCenterConstraint];
        
        _infiniteScrollView = infiniteScrollView;
        return _infiniteScrollView;
    }
}

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self.dataDisplayManager;
    self.tableView.delegate = self.dataDisplayManager;
    
    self.tableView.estimatedRowHeight = TableViewEstimatedRowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self addPullToRefreshControl];

    self.tableView.tableFooterView = self.infiniteScrollView;
    
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

- (void)addTweets:(NSArray<Tweet *> *)tweets
  withAuthorPhoto:(BOOL)showAuthorPhoto {
    [self.dataDisplayManager addTweets:tweets
                        withAuthorPhoto:showAuthorPhoto];
    [self.tableView reloadData];
}

- (void)hideSpinners {
    if (self.pullToRefreshControl.isRefreshing == YES) {
        [self.pullToRefreshControl endRefreshing];
    }
    
    if (self.infiniteScrollActivityIndicatorView.animating == YES) {
        [self.infiniteScrollActivityIndicatorView stopAnimating];
    }
}

#pragma mark - FeedDataDisplayManagerDelegate

- (void)didTapOnTweetWithIndex:(NSUInteger)tweetIndex {
    [self.output didSelectTweetAtIndex:tweetIndex];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.tableView == scrollView) {
        CGFloat offset = scrollView.contentOffset.y;
        CGFloat maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
        CGFloat delta = maximumOffset - offset;
        
        BOOL shouldLoadMoreNews = (delta <= 0) && (self.infiniteScrollActivityIndicatorView.isAnimating == NO);
        
        if (shouldLoadMoreNews == YES) {
            [self.infiniteScrollActivityIndicatorView startAnimating];
            [self.output loadMoreTweets];
        }
    }
}

#pragma mark - UIRefreshControl

- (void)pullToRefreshControlValueChanged {
    [self.output loadFreshTweets];
}

@end
