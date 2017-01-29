//
//  SettingsAssembly_Testable.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsAssembly.h"

@class SettingsViewController;
@class SettingsInteractor;
@class SettingsPresenter;
@class SettingsRouter;

/**
 @author a.sapozhnik

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface SettingsAssembly ()

- (SettingsViewController *)viewSettings;
- (SettingsPresenter *)presenterSettings;
- (SettingsInteractor *)interactorSettings;
- (SettingsRouter *)routerSettings;

@end
