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

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"count"    : @"count",
             @"next"     : @"next",
             @"previous" : @"previous",
             @"results"  : @"results"
             };
}

- (void)fetchWithSuccess:(SuccessWithModelCollection)success
{
    if ( ! self.currentPage ) { self.currentPage = @1; };
    [self fetchFromPageNumber:self.currentPage
           withDoingAtSuccess:success];
}

-(void)fetchFromPageNumber:(NSNumber *)thePageNumber
        withDoingAtSuccess:(SuccessWithModelCollection)success
{
    NSDictionary *parameters = @{ @"page": thePageNumber };
    [[SCSharedClient sharedClient]
     GET:[self.class getModelEndPointUrl]
     parameters:parameters
     success:^(NSURLSessionDataTask *task, id responseObject)
    {
        [self fromDictionary:responseObject];
        /**
         *  Executing success with model collection collection.
         */
        success(self);
    }
     failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        // TODO:  Add error manager for fetch
        //  on abstract model collection.
    }];
}

- (void)fetchPreviousWithSuccess:(SuccessWithModelCollection)success
{
    if (self.previous) {
        //previous number page
        self.currentPage = @([self.currentPage integerValue] - 1);
        [self fetchWithSuccess:success];
    }
}

- (void)fetchNextWithSuccess:(SuccessWithModelCollection)success
{
    if (self.previous) {
        //previous number page
        self.currentPage = @([self.currentPage integerValue] + 1);
        [self fetchWithSuccess:success];
    }
}

@end