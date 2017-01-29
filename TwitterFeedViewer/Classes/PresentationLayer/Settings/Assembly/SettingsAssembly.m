//
//  SettingsAssembly.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsAssembly.h"

#import "SettingsViewController.h"
#import "SettingsInteractor.h"
#import "SettingsPresenter.h"
#import "SettingsRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

#import "ServicesAssemblyProtocol.h"

@interface SettingsAssembly ()

@property (nonatomic, strong, readonly) TyphoonAssembly<ServicesAssemblyProtocol> *servicesAssembly;

@end

@implementation SettingsAssembly

- (SettingsViewController *)viewSettings {
    return [TyphoonDefinition withClass:[SettingsViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSettings]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterSettings]];
                          }];
}

- (SettingsInteractor *)interactorSettings {
    return [TyphoonDefinition withClass:[SettingsInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSettings]];
                              [definition injectProperty:@selector(settingsService)
                                                    with:[self.servicesAssembly settingsService]];
                          }];
}

- (SettingsPresenter *)presenterSettings{
    return [TyphoonDefinition withClass:[SettingsPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewSettings]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorSettings]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerSettings]];
                          }];
}

- (SettingsRouter *)routerSettings{
    return [TyphoonDefinition withClass:[SettingsRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewSettings]];
                          }];
}

@end
