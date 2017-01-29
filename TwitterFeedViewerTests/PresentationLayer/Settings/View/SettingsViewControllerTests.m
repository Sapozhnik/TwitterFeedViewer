//
//  SettingsViewControllerTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "SettingsViewController.h"

#import "SettingsViewOutput.h"

@interface SettingsViewControllerTests : XCTestCase

@property (nonatomic, strong) SettingsViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation SettingsViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[SettingsViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(SettingsViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов SettingsViewInput

@end
