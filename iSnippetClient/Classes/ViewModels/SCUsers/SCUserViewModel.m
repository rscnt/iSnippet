//
//  SCUserViewModel.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCUserViewModel.h"

@implementation SCUserViewModel

-(instancetype)initWithUser:(SCUser *)theUser
{
    self = [super init];
    if (self) {
        _user = theUser;
        _textTitle = [NSString stringWithFormat:@"View user: %@", _user.username];
    }
    return self;
}

@end
