//
//  SettingsViewInput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SettingsViewInput <NSObject>

- (void)setupInitialStateWithImageSwitchState:(BOOL)state;

@end
