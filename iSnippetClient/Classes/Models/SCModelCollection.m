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
   [self getWithParameters:parameters andRecieveWithCallback:^(NSDictionary *dictionary) {
        /**
         *  Executing success with model collection collection.
         */
        [self fromDictionary:dictionary];
        success(self);
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

-(void)getWithParameters:(NSDictionary *)dictionary
  andRecieveWithCallback:(void (^)(NSDictionary *))callback
{
    [[SCSharedClient sharedClient] GET:[self.class getModelEndPointUrl] parameters:dictionary success:^(NSURLSessionDataTask *task, id responseObject) {
        callback(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error at fetching a detailed model.");
    }];
}

@end