//
//  SCModelCollection.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCModelCollection.h"
#import "SCSharedClient.h"

@implementation SCModelCollection

+ (instancetype)sharedCollection
{
    static SCModelCollection *_sharedCollection = nil;
    dispatch_once_t *predictate;
    dispatch_once(predictate, ^{
        _sharedCollection = [[SCModelCollection alloc] init];
    });
    return _sharedCollection;
}

- (void)fetch
{
    if ( ! self.currentPage ) { self.currentPage = @1; };
    [self fetchFromPageNumber:self.currentPage];
}

-(void)fetchFromPageNumber:(NSNumber *)thePageNumber
{
    NSDictionary *parameters = @{ @"page": thePageNumber };
    [[SCSharedClient sharedClient]
     GET:[SCModelCollection getModelEndPointUrl]
     parameters:parameters
     success:^(NSURLSessionDataTask *task, id responseObject)
    {
        [self fromDictionary:responseObject];
    }
     failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        // TODO:  Add error manager for fetch
        //  on abstract model collection.
    }];
}

- (void)fetchPrevious
{
    if (self.previous) {
        //previous number page
        self.currentPage = @([self.currentPage integerValue] - 1);
        [self fetch];
    }
}

- (void)fetchNext
{
    if (self.previous) {
        //previous number page
        self.currentPage = @([self.currentPage integerValue] + 1);
        [self fetch];
    }
}

@end