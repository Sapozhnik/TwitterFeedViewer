//
//  DetailTweetPresenterTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "DetailTweetPresenter.h"

#import "DetailTweetViewInput.h"
#import "DetailTweetInteractorInput.h"
#import "DetailTweetRouterInput.h"

@interface DetailTweetPresenterTests : XCTestCase

@property (nonatomic, strong) DetailTweetPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation DetailTweetPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[DetailTweetPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(DetailTweetInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(DetailTweetRouterInput));
    self.mockView = OCMProtocolMock(@protocol(DetailTweetViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов DetailTweetModuleInput

#pragma mark - Тестирование методов DetailTweetViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialStateWithTweet:[OCMArg any]]);
}

#pragma mark - Тестирование методов DetailTweetInteractorOutput

@end
