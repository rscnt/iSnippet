//
//  SCModelDetailed.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCModel.h"

@interface SCModelDetailed : SCModel

/**
 *  The identifier, a field common for all detail models.
 */
@property (readonly, nonatomic) NSInteger *id;

/**
 *  Initilizer recive an id.
 *
 *  @return the object with the id or null if no instance exists with that id
 */
-(instancetype)init:(NSInteger *)withId;

/**
 *  Returns the url pointing to the instance.
 *
 *  @return the url for the instance object given an id.
 */
-(NSString *)getInstanceUrl;

@end
