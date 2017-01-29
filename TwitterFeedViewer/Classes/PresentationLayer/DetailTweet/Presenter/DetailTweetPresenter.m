//
//  DetailTweetPresenter.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "DetailTweetPresenter.h"

#import "DetailTweetViewInput.h"
#import "DetailTweetInteractorInput.h"
#import "DetailTweetRouterInput.h"

#import "Tweet.h"

@interface DetailTweetPresenter ()

@property (nonatomic, strong) Tweet *tweet;

@end

@implementation DetailTweetPresenter

#pragma mark - Методы DetailTweetModuleInput

- (void)configureModuleWithTweet:(Tweet *)tweet {
    self.tweet = tweet;
}

#pragma mark - Методы DetailTweetViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialStateWithTweet:self.tweet];
}

#pragma mark - Методы DetailTweetInteractorOutput

@end
