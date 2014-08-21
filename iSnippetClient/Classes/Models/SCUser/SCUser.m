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

-(void)setProperties:(NSDictionary *)withDictionary
{
    
}

-(instancetype)get:(NSObject *)withParameters
{
    /*
    [[SCSharedClient sharedClient] GET:[self getInstanceUrl] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = [[NSError alloc] init];
        AFJSONResponseSerializer *serializer = [[AFJSONResponseSerializer alloc] init];
        id jsonDict = [serializer responseObjectForResponse:responseObject data:nil error:&error];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }]
    return self;
    */
}

@end
