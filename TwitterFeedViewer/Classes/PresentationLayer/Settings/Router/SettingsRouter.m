//
//  SettingsRouter.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation SettingsRouter

#pragma mark - Методы SettingsRouterInput

- (void)closeModule {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
