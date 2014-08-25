//
//  SCUserViewModel.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCUser.h"

@interface SCUserViewModel : NSObject

/**
 *  The user for the scuser.
 */
@property (readonly, nonatomic) SCUser *user;

/**
 *  The text title for the user view.
 */
@property (readonly, nonatomic) NSString *textTitle;

/**
 *  A new instance for the user.
 *
 *  @param theUser SCUser.
 *
 *  @return an instance.
 */
- (instancetype) initWithUser:(SCUser *)theUser;

@end
