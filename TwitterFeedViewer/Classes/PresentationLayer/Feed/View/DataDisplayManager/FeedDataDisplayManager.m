//
//  FeedDataDisplayManager.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedDataDisplayManager.h"
#import "TweetCellObjectFactory.h"

@interface FeedDataDisplayManager ()

@property (nonatomic, strong) NSMutableArray *cellObjects;

@end

@implementation FeedDataDisplayManager

- (void)showTweets:(NSArray<Tweet *> *)tweets
   withAuthorPhoto:(BOOL)showAuthorPhoto {
    self.cellObjects = [[self.cellObjectFactory tweetCellObjectsFromTweets:tweets
                                                     shouldShowAuthorPhoto:showAuthorPhoto] mutableCopy];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

@end
