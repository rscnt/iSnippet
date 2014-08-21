//
//  SCSharedClient.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSharedClient.h"
#import "SCModel.h"

@implementation SCSharedClient

+(instancetype)sharedClient
{
    static SCSharedClient *_sharedClient = nil;
    static dispatch_once_t *predicate;
    dispatch_once(predicate, ^{
        _sharedClient = [[SCSharedClient alloc] initWithBaseURL:
                         [NSURL URLWithString:[SCModel getApiEndPointUrl]]];
    });
    return _sharedClient;
}
@end