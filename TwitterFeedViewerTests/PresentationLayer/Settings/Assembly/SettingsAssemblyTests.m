//
//  SettingsAssemblyTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "SettingsAssembly.h"
#import "SettingsAssembly_Testable.h"

#import "SettingsViewController.h"
#import "SettingsPresenter.h"
#import "SettingsInteractor.h"
#import "SettingsRouter.h"

#import "ServicesAssembly.h"
#import "CoreComponentsAssembly.h"

@interface SettingsAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) SettingsAssembly *assembly;

@end

@implementation SettingsAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];
    
    self.assembly = [[SettingsAssembly alloc] init];
    
    NSArray *collaboratingAssemblies = @[
                                         [ServicesAssembly new],
                                         [CoreComponentsAssembly new]                                         ];
    [self.assembly activateWithCollaboratingAssemblies:collaboratingAssemblies];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [SettingsViewController class];
    NSArray *protocols = @[
                           @protocol(SettingsViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewSettings];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [SettingsPresenter class];
    NSArray *protocols = @[
                           @protocol(SettingsModuleInput),
                           @protocol(SettingsViewOutput),
                           @protocol(SettingsInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterSettings];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [SettingsInteractor class];
    NSArray *protocols = @[
                           @protocol(SettingsInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
													      
    // when
    id result = [self.assembly interactorSettings];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [SettingsRouter class];
    NSArray *protocols = @[
                           @protocol(SettingsRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerSettings];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
