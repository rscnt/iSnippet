//
//  SCUsersViewModel.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCUsers.h"

@interface SCUsersViewModel : NSObject


@property (readonly, nonatomic) SCUsers *users;
@property (readonly, nonatomic) NSString *textTitle;

- (instancetype) initWithUsers:(SCUsers *)theUsers;

@end
