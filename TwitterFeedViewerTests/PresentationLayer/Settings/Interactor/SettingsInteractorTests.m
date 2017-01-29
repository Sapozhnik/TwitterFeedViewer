//
//  SettingsInteractorTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "SettingsInteractor.h"

#import "SettingsInteractorOutput.h"

@interface SettingsInteractorTests : XCTestCase

@property (nonatomic, strong) SettingsInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation SettingsInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[SettingsInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(SettingsInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов SettingsInteractorInput

@end
