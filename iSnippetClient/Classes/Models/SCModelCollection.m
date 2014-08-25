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

- (void)fetch
{
    if ( ! self.currentPage ) { self.currentPage = @1; };
    [self fetchFromPageNumber:self.currentPage];
}

-(void)fetchFromPageNumber:(NSNumber *)thePageNumber
{
    NSDictionary *parameters = @{ @"page": thePageNumber };
    [[SCSharedClient sharedClient]
     GET:[self.class getModelEndPointUrl]
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