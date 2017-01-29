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

@implementation DetailTweetPresenter

#pragma mark - Методы DetailTweetModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы DetailTweetViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Методы DetailTweetInteractorOutput

@end
