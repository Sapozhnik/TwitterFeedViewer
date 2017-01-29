//
//  RequestConfigurator.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

//Protocols
#import "RequestConfiguratorProtocol.h"

@interface RequestConfigurator : NSObject <RequestConfiguratorProtocol>

@property (nonatomic, copy) NSString *baseLink;
@property (nonatomic, copy) NSString *bearerToken;

@end
