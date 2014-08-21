//
//  SCModel.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCModel.h"

@implementation SCModel

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
    return [NSString stringWithFormat:@"%@%@", self.getApiEndPointUrl, self.namespace];
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

@end
