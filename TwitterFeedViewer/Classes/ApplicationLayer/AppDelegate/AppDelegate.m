//
//  AppDelegate.m
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "AppDelegate.h"

// Libraries
#import <RamblerTyphoonUtils/AssemblyCollector.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - InitialAssemblies

// activates assemblies. performs from TyphoonStartup.m:46
- (NSArray *)initialAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    NSArray *initialAssemblies = [collector collectInitialAssemblyClasses];
    return initialAssemblies;
}

@end
