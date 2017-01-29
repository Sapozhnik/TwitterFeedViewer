//
//  FeedDataDisplayManagerDelegate.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedDataDisplayManagerDelegate <NSObject>

- (void)didTapOnTweetWithIndex:(NSUInteger)tweetIndex;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end
