//
//  SettingsPresenterTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "SettingsPresenter.h"

#import "SettingsViewInput.h"
#import "SettingsInteractorInput.h"
#import "SettingsRouterInput.h"

@interface SettingsPresenterTests : XCTestCase

@property (nonatomic, strong) SettingsPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation SettingsPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[SettingsPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(SettingsInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(SettingsRouterInput));
    self.mockView = OCMProtocolMock(@protocol(SettingsViewInput));

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

#pragma mark - Тестирование методов SettingsModuleInput

#pragma mark - Тестирование методов SettingsViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given
    BOOL expectedFlag = YES;
    OCMStub([self.mockInteractor obtainShowUsersPhotoFlag]).andReturn(expectedFlag);
    
    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialStateWithImageSwitchState:expectedFlag]);
}

#pragma mark - Тестирование методов SettingsInteractorOutput

@end
