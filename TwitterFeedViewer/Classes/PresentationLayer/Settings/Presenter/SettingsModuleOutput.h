//
//  SettingsModuleOutput.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol SettingsModuleOutput <RamblerViperModuleOutput>

- (void)settingsModuleWillClose;

@end
