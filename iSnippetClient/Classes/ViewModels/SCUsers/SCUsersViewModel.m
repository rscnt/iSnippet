//
//  SCUsersViewModel.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCUsersViewModel.h"

@implementation SCUsersViewModel

- (instancetype) initWithUsers:(SCUsers *)theUsers
{
    self = [[SCUsersViewModel alloc] init];
    if (self) {
        _users = theUsers;
        _textTitle = [NSString stringWithFormat:@"Number of users: %u", _users.results.count];
    }
    return self;
}

@end
