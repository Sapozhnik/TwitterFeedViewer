//
//  FeedDataDisplayManager.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedDataDisplayManager.h"

// Dependencies
#import "TweetCellObjectFactory.h"

// Entities
#import "TweetCellObject.h"

#import "UpdatableCellProtocol.h"

@interface FeedDataDisplayManager ()

@property (nonatomic, strong) NSMutableArray<TweetCellObject *> *cellObjects;

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
    id<CellObjectProtocol> cellObject = self.cellObjects[indexPath.row];
    
    UINib *cellNib = [cellObject cellNib];
    NSString *cellIdentifier = NSStringFromClass([cellObject cellClass]);
    
    [tableView registerNib:cellNib
    forCellReuseIdentifier:cellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    id<UpdatableCellProtocol>updatableCell = (id<UpdatableCellProtocol>)cell;
    [updatableCell updateWithCellObject:cellObject];
    
    return [UITableViewCell new];
}

@end
