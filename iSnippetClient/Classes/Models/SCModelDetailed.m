//
//  SCModelDetailed.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCModelDetailed.h"

@implementation SCModelDetailed

-(instancetype)init:(NSInteger *)withId
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _id = withId;
    return self;
}

-(NSString *)getInstanceUrl
{
    return [NSString stringWithFormat:@"%@%ld",
            SCModelDetailed.getModelEndPointUrl, (long)self.id];
}


-(void)getWithParameters:(NSDictionary *)dictionary
  andRecieveWithCallback:(void (^)(NSDictionary *))callback
{
    [[SCSharedClient sharedClient] GET:[self getInstanceUrl] parameters:dictionary success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        callback(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error at fetching a detailed model.");
    }];
}

@end
