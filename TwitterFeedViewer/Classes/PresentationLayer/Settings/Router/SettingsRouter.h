//
//  SettingsRouter.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface SettingsRouter : NSObject <SettingsRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
