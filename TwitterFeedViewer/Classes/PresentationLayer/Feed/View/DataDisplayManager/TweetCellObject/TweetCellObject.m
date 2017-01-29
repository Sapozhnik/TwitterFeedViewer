//
//  TweetCellObject.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "TweetCellObject.h"

#import <UIKit/UIKit.h>

#import "TweetCell.h"

@implementation TweetCellObject

#pragma mark - CellObjectProtocol

- (Class)cellClass {
    return [TweetCell class];
}

- (id)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([self cellClass])
                          bundle:[NSBundle bundleForClass:[self class]]];
}

@end
