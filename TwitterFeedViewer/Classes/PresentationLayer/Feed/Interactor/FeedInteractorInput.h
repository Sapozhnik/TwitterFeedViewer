//
//  FeedInteractorInput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlockWithResultObjects)(NSArray *objects, NSError *error);

@protocol FeedInteractorInput <NSObject>

- (void)loadTweetsWithQuery:(NSString *)query
                      count:(NSUInteger)count
                    afterId:(NSString *)afterId;

- (void)checkFreshTweetsWithQuery:(NSString *)query
                            count:(NSUInteger)count
                         beforeId:(NSString *)newestTweetId;

- (BOOL)obtainShowUsersPhotoFlag;

@end
