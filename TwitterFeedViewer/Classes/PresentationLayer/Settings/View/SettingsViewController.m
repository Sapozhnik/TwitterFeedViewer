//
//  SettingsViewController.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsViewController.h"

#import "SettingsViewOutput.h"

@implementation SettingsViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

- (IBAction)doneButtonDidTap:(id)sender {
    [self.output doneButtonDidTap];
}

- (IBAction)imageSwitchDidChangeValue:(UISwitch *)sender {
    [self.output imageSwitchDidChangeToState:sender.isSelected];
}

#pragma mark - Методы SettingsViewInput

- (void)setupInitialStateWithImageSwitchState:(BOOL)state {
    self.imageSwitch.selected = state;
}

@end
