//
//  RequestConfigurator.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "RequestConfigurator.h"

static NSString *const RequestConfiguratorBearerString  = @"Bearer";
static NSString *const RequestConfiguratorAuthorizationHeaderName = @"Authorization";

@implementation RequestConfigurator

- (NSURLRequest *)requestWithQueryItems:(NSArray<NSURLQueryItem *> *)queryItems {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:self.baseLink];
    urlComponents.queryItems = queryItems;
    
    NSURL *urlFromComponents = urlComponents.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlFromComponents];
    
    NSString *authorizationValue = [NSString stringWithFormat:@"%@ %@", RequestConfiguratorBearerString, self.bearerToken];
    
    [request setValue:authorizationValue
   forHTTPHeaderField:RequestConfiguratorAuthorizationHeaderName];
    
    return [request mutableCopy];
}

@end
