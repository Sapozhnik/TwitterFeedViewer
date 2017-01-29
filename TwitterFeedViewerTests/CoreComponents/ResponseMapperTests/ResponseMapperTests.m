//
//  ResponseMapperTests.m
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ResponseMapper.h"

#import "MappingProvider.h"

// Entities
#import "Tweet.h"
#import "User.h"

@interface ResponseMapperTests : XCTestCase

@property (nonatomic, strong) ResponseMapper *mapper;

@end

@implementation ResponseMapperTests

- (void)setUp {
    [super setUp];
    
    self.mapper = [ResponseMapper new];
    MappingProvider *tweetMappingProvider = [MappingProvider new];
    self.mapper.tweetMappingProvider = tweetMappingProvider;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testThatMapperMapsCorrectly {

    // given
    NSDictionary *json = [self jsonFromFileWithName:@"feed_with_2_tweets"];
    
    // when
    NSArray<Tweet *> *tweets = [self.mapper tweetsFromResponse:json];
    
    // then
    XCTAssertTrue(tweets.count == 2u);
    
    Tweet *firstTweet = tweets.firstObject;
    XCTAssertEqualObjects(firstTweet.tweetId, @"825424777192075264");
    XCTAssertNotNil(firstTweet.text);
    XCTAssertEqualObjects(firstTweet.user.name, @"sam");
    XCTAssertEqualObjects(firstTweet.user.profileImageURL.absoluteString, @"https://pbs.twimg.com/profile_images/486619223288852482/UWsT1mU1_normal.jpeg");
    XCTAssertTrue(firstTweet.date.timeIntervalSinceReferenceDate == 507324377);
    
    Tweet *secondTweet = tweets[1u];
    XCTAssertEqualObjects(secondTweet.tweetId, @"825424775958949893");
    XCTAssertEqualObjects(secondTweet.text, @"Check out Halle Berry at https://t.co/WAGhm8T5DT  via @getMSCLVR #SXSW #FreeLoftPartyTonight #HipHopWeekly");
    XCTAssertEqualObjects(secondTweet.user.name, @"LetMeManageYou");
    XCTAssertEqualObjects(secondTweet.user.profileImageURL.absoluteString, @"https://pbs.twimg.com/profile_images/553382566049234944/Hu9wh3Ac_normal.jpeg");
    XCTAssertTrue(secondTweet.date.timeIntervalSinceReferenceDate == 507324376);
}

#pragma mark - Helpers 

- (id)jsonFromFileWithName:(NSString *)fileName {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    NSString *filePath = [bundle pathForResource:fileName
                                          ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

    return json;
}

@end
