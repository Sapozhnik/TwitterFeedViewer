//
//  SettingsViewController.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SettingsViewInput.h"

@protocol SettingsViewOutput;

@interface SettingsViewController : UIViewController <SettingsViewInput>

@property (nonatomic, strong) id<SettingsViewOutput> output;

@property (weak, nonatomic) IBOutlet UISwitch *imageSwitch;

- (IBAction)doneButtonDidTap:(id)sender;
- (IBAction)imageSwitchDidChangeValue:(id)sender;

@end
