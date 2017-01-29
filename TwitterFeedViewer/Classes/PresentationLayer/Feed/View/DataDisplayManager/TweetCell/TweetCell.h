//
//  TweetCell.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdatableCellProtocol.h"

@interface TweetCell : UITableViewCell <UpdatableCellProtocol>
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *authorImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *visiblePhotoConstraints;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *hidePhotoConstraints;


@end
