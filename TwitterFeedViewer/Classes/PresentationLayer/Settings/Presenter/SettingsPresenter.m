//
//  SettingsPresenter.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsPresenter.h"

#import "SettingsViewInput.h"
#import "SettingsInteractorInput.h"
#import "SettingsRouterInput.h"

#import "SettingsModuleOutput.h"

@implementation SettingsPresenter

#pragma mark - Методы SettingsModuleInput

#pragma mark - Методы SettingsViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialStateWithImageSwitchState:NO];
}

- (void)imageSwitchDidChangeToState:(BOOL)state {
    
}

- (void)doneButtonDidTap {
    [self.moduleOutput settingsModuleWillClose];
    [self.router closeModule];
}

#pragma mark - Методы SettingsInteractorOutput

@end
