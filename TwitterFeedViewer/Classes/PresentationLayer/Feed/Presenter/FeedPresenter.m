//
//  FeedPresenter.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedPresenter.h"

#import "FeedViewInput.h"
#import "FeedInteractorInput.h"
#import "FeedRouterInput.h"

@implementation FeedPresenter

#pragma mark - Методы FeedModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы FeedViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Методы FeedInteractorOutput

@end
