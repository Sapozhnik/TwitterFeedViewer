//
//  DetailTweetViewControllerTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "DetailTweetViewController.h"

#import "DetailTweetViewOutput.h"

@interface DetailTweetViewControllerTests : XCTestCase

@property (nonatomic, strong) DetailTweetViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation DetailTweetViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[DetailTweetViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(DetailTweetViewOutput));

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

#pragma mark - Тестирование методов DetailTweetViewInput

@end
