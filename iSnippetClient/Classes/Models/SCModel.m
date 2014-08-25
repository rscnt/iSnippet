//
//  SCModel.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCModel.h"

@implementation SCModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    @throw [NSException
            exceptionWithName:NSInternalInconsistencyException
            reason:[NSString stringWithFormat:@"You must override %@ in a subclass",NSStringFromSelector(_cmd)]
            userInfo:nil];
}

#pragma mark Static messages.

+(NSString *)getApiEndPointUrl
{
    return [NSString stringWithFormat:@"%@%@", host, endpoint];
}

+(NSString *)namespace
{
    @throw [NSException
            exceptionWithName:NSInternalInconsistencyException
            reason:[NSString stringWithFormat:@"You must override %@ in a subclass",NSStringFromSelector(_cmd)]
            userInfo:nil];
}

+(NSString *)getModelEndPointUrl
{
    return [NSString stringWithFormat:@"%@%@", [self getApiEndPointUrl], [self namespace]];
}

+(NSString *)getAuthEndPointUrl
{
    return [NSString stringWithFormat:@"%@%@/", [self getApiEndPointUrl], @"api-auth"];
}


#pragma mark Instance messages.

- (NSString *)namespace
{
    @throw [NSException
            exceptionWithName:NSInternalInconsistencyException
            reason:[NSString stringWithFormat:@"You must override %@ in a subclass",NSStringFromSelector(_cmd)]
            userInfo:nil];
}

-(instancetype)get:(NSObject *)withParameters
{
    return self;
}

-(instancetype)post:(NSObject *)withParamters
{
    return self;
}

- (NSDictionary *)asDictionary
{
    NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:self];
    return JSONDictionary;
}

- (instancetype)fromDictionary:(NSDictionary *)aDictionary
{
    NSError *error = nil;
    id model = [MTLJSONAdapter modelOfClass:self.class
                         fromJSONDictionary:aDictionary
                                      error:&error];
    [self mergeValuesForKeysFromModel:model];
    return model;
}

@end