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
    return [super performSelector:NSSelectorFromString(@"JSONKeyPathsByPropertyKey")];
}

#pragma mark Static messages.

+(NSString *)getApiEndPointUrl
{
    return [NSString stringWithFormat:@"%@%@", host, endpoint];
}

+(NSString *)namespace
{
    return self.namespace;
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