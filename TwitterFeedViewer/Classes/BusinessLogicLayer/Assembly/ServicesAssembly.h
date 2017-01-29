//
//  ServicesAssembly.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

// Protocols
#import "ServicesAssemblyProtocol.h"

@interface ServicesAssembly : TyphoonAssembly <ServicesAssemblyProtocol, RamblerInitialAssembly>

@end
