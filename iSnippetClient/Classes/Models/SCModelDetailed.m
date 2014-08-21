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
    if (self) {
        _id = withId;
    }
    return self;
}

-(NSString *)getInstanceUrl
{
    return [NSString stringWithFormat:@"%@%ld", SCModelDetailed.getModelEndPointUrl,
            (long)self.id];
}

@end
