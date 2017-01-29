//
//  DetailTweetRouterTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "DetailTweetRouter.h"

@interface DetailTweetRouterTests : XCTestCase

@property (nonatomic, strong) DetailTweetRouter *router;

@end

@implementation DetailTweetRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[DetailTweetRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
