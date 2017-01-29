//
//  FeedRouter.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

#import "DetailTweetModuleInput.h"

static NSString *const OpenTweetSegueName = @"OpenTweetSegue";

@implementation FeedRouter

#pragma mark - Методы FeedRouterInput

- (void)openTweetDetailModuleWithTweet:(Tweet *)tweet {
    [[self.transitionHandler openModuleUsingSegue:OpenTweetSegueName] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<DetailTweetModuleInput> moduleInput) {
        [moduleInput configureModuleWithTweet:tweet];
        return nil;
    }];
}

@end
