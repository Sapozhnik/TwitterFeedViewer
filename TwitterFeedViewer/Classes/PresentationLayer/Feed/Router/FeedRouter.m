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

#import "SettingsModuleOutput.h"

static NSString *const OpenTweetSegueName = @"OpenTweetSegue";
static NSString *const OpenSettingsSegueName = @"OpenSettingsSegue";

@implementation FeedRouter

#pragma mark - Методы FeedRouterInput

- (void)openTweetDetailModuleWithTweet:(Tweet *)tweet {
    [[self.transitionHandler openModuleUsingSegue:OpenTweetSegueName] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<DetailTweetModuleInput> moduleInput) {
        [moduleInput configureModuleWithTweet:tweet];
        return nil;
    }];
}

- (void)openSettingsModuleWithModuleOutput:(id<SettingsModuleOutput>)moduleOutput {
    [[self.transitionHandler openModuleUsingSegue:OpenSettingsSegueName] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<RamblerViperModuleInput> moduleInput) {
        return moduleOutput;
    }];
}

@end
