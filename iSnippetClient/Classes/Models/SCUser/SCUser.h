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
 *  Set the user with the values 
 * given by the dictionary.
 *
 *  @param dict The dictionary for the user.
 */
-(void)setProperties:(NSDictionary *)withDictionary;

@end
