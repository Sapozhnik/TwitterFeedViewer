//
//  SettingsInteractor.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsInteractorInput.h"

@protocol SettingsInteractorOutput;

@interface SettingsInteractor : NSObject <SettingsInteractorInput>

@property (nonatomic, weak) id<SettingsInteractorOutput> output;

@end
