//
//  DetailTweetInteractorTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "DetailTweetInteractor.h"

#import "DetailTweetInteractorOutput.h"

@interface DetailTweetInteractorTests : XCTestCase

@property (nonatomic, strong) DetailTweetInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation DetailTweetInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[DetailTweetInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(DetailTweetInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов DetailTweetInteractorInput

@end
