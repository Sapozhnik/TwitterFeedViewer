//
//  FeedViewControllerTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "FeedViewController.h"

#import "FeedViewOutput.h"

@interface FeedViewControllerTests : XCTestCase

@property (nonatomic, strong) FeedViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation FeedViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[FeedViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(FeedViewOutput));

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

#pragma mark - Тестирование методов FeedViewInput

@end
