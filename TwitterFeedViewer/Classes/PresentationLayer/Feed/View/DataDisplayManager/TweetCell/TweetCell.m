//
//  TweetCell.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "TweetCell.h"
#import "TweetCellObject.h"

// Libraries
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *const TweetCellProfileImagePlaceholderName = @"user_placeholder";

@implementation TweetCell

- (void)updateConstraints {
    NSArray *activeConstraints;
    NSArray *disabledConstraints;

    if (self.authorImage.isHidden == NO) {
        activeConstraints = self.visiblePhotoConstraints;
        disabledConstraints = self.hidePhotoConstraints;
    } else {
        activeConstraints = self.hidePhotoConstraints;
        disabledConstraints = self.visiblePhotoConstraints;
    }
    
    for (NSLayoutConstraint *constraint in disabledConstraints) {
        constraint.active = NO;
    }
    
    for (NSLayoutConstraint *constraint in activeConstraints) {
        constraint.active = YES;
    }
    
    [super updateConstraints];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];
    self.tweetTextLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tweetTextLabel.bounds);
}

#pragma mark - UpdatableCellProtocol

- (void)updateWithCellObject:(TweetCellObject *)cellObject {

    self.authorNameLabel.text = cellObject.authorName;
    self.dateLabel.text = cellObject.date;
    self.tweetTextLabel.text = cellObject.text;

    if (cellObject.showImage == YES) {
        [self.authorImage sd_setImageWithURL:cellObject.profileImageURL
                            placeholderImage:[UIImage imageNamed:TweetCellProfileImagePlaceholderName]];
        self.authorImage.hidden = NO;
    } else {
        self.authorImage.hidden = YES;
    }

    [self setNeedsUpdateConstraints];
}

@end
