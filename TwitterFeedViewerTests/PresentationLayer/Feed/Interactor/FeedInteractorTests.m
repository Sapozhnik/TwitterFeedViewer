//
//  FeedInteractorTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "FeedInteractor.h"

#import "FeedInteractorOutput.h"

@interface FeedInteractorTests : XCTestCase

@property (nonatomic, strong) FeedInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation FeedInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[FeedInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(FeedInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов FeedInteractorInput

@end
