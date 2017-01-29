//
//  FeedAssemblyTests.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "FeedAssembly.h"
#import "FeedAssembly_Testable.h"

#import "FeedViewController.h"
#import "FeedPresenter.h"
#import "FeedInteractor.h"
#import "FeedRouter.h"

#import "ServicesAssembly.h"
#import "CoreComponentsAssembly.h"

@interface FeedAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) FeedAssembly *assembly;

@end

@implementation FeedAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [[FeedAssembly alloc] init];
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
    Class targetClass = [FeedViewController class];
    NSArray *protocols = @[
                           @protocol(FeedViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewFeed];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [FeedPresenter class];
    NSArray *protocols = @[
                           @protocol(FeedModuleInput),
                           @protocol(FeedViewOutput),
                           @protocol(FeedInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterFeed];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [FeedInteractor class];
    NSArray *protocols = @[
                           @protocol(FeedInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
													      
    // when
    id result = [self.assembly interactorFeed];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [FeedRouter class];
    NSArray *protocols = @[
                           @protocol(FeedRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerFeed];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
