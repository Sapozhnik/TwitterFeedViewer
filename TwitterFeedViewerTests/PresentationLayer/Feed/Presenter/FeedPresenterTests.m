//
//  FeedPresenterTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "FeedPresenter.h"

#import "FeedViewInput.h"
#import "FeedInteractorInput.h"
#import "FeedRouterInput.h"

@interface FeedPresenterTests : XCTestCase

@property (nonatomic, strong) FeedPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation FeedPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[FeedPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(FeedInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(FeedRouterInput));
    self.mockView = OCMProtocolMock(@protocol(FeedViewInput));

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

#pragma mark - Тестирование методов FeedModuleInput

#pragma mark - Тестирование методов FeedViewOutput

#pragma mark - Тестирование методов FeedInteractorOutput

@end
