//
//  SettingsViewOutput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SettingsViewOutput <NSObject>

/**
 @author a.sapozhnik

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

- (void)doneButtonDidTap;

- (void)imageSwitchDidChangeToState:(BOOL)state;

@end
