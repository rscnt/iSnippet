//
//  SCUser.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCUser.h"
#import "SCSharedClient.h"


@implementation SCUser


+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"url"      : @"url",
             @"username" : @"username",
             @"snippets" : @"snippets"
             };
}

+ (NSString *)namespace
{
    return @"users";
}

-(instancetype)initWithUsername:(NSString *)username andPassword:(NSString *)andPasswords
{
    self = [super init];
    if (self) {
        [self authenticateUserWithUsername:username andPassword:andPasswords];
    }
    return self;
}

-(instancetype)authenticateUserWithUsername:(NSString *)username andPassword:(NSString *)andPassword
{
    [[SCSharedClient sharedClient] setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [[SCSharedClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithUsername:username password:andPassword];
    return nil;
}

-(instancetype)get:(NSObject *)withParameters
{
    [[SCSharedClient sharedClient] GET:[self getInstanceUrl] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = [[NSError alloc] init];
        AFJSONResponseSerializer *serializer = [[AFJSONResponseSerializer alloc] init];
        id jsonDict = [serializer responseObjectForResponse:responseObject data:nil error:&error];
        [self fromDictionary:jsonDict];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //pass
    }];
    return self;
}

@end
