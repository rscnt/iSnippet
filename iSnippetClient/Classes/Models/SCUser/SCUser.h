//
//  SCUser.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCModelDetailed.h"

/**
 *  This class represents an user object
 *  on the snippet server.
 */
@interface SCUser : SCModelDetailed

@property (readonly, strong, nonatomic) NSString       *url;
@property (strong, nonatomic          ) NSString       *username;
@property (strong, nonatomic          ) NSMutableArray *snippets;

/**
 *  Given an username and password this methods send a request
 *  to the server to authenticated the user.
 *
 *  @param username    string.
 *  @param andPassword string.
 *
 *  @return an user object requested.
 */
+(instancetype)authenticateUserWithUsername:(NSString *)username
                                andPassword:(NSString*)andPassword;

@end
