//
//  FeedViewOutput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedViewOutput <NSObject>

/**
 @author a.sapozhnik

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

- (void)loadFreshTweets;

- (void)loadMoreTweets;

- (void)didSelectTweetAtIndex:(NSUInteger)tweetIndex;

- (void)settingsButtonDidTap;

- (void)bubleTapped;

@end
