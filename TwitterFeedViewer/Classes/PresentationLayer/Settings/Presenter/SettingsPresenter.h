//
//  SettingsPresenter.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsViewOutput.h"
#import "SettingsInteractorOutput.h"
#import "SettingsModuleInput.h"

@protocol SettingsViewInput;
@protocol SettingsInteractorInput;
@protocol SettingsRouterInput;

@protocol SettingsModuleOutput;

@interface SettingsPresenter : NSObject <SettingsModuleInput, SettingsViewOutput, SettingsInteractorOutput>

@property (nonatomic, weak) id<SettingsViewInput> view;
@property (nonatomic, strong) id<SettingsInteractorInput> interactor;
@property (nonatomic, strong) id<SettingsRouterInput> router;

@property (nonatomic, weak) id<SettingsModuleOutput> moduleOutput;

@end
