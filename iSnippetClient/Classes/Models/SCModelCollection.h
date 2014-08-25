//
//  SCModelCollection.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCModel.h"

@interface SCModelCollection : SCModel

typedef void(^SuccessWithModelCollection)(SCModelCollection* modelCollection);


/**
 *  The quantity of objects in the server 
 *  for the model.
 */
@property (strong, nonatomic) NSString *count;
/**
 *  The url for the next bulck of objects.
 */
@property (strong, nonatomic) NSString *next;
/**
 *  The url for the previous bulck of objects.
 */
@property (strong, nonatomic) NSString *previous;
/**
 *  The array with the objects for the model.
 */
@property (strong, nonatomic) NSMutableArray *results;
/**
 *  The number of the current page to send to the parameter.
 */
@property (nonatomic) NSNumber *currentPage;

/**
 *  Fetchs the objects for the current page number
 *  defaults to 1 if no set.
 */
-(void) fetchWithSuccess:(SuccessWithModelCollection)success;

/**
 *  Fetch the object for a page number given.
 *
 *  @param thePageNumber  an integer.
 */
/**
 *  Fetch from a page number with a given respond.
 *
 *  @param thePageNumber the number of the page that is beign fetched.
 *  @param callback      the callback that acts at success.
 */
-(void) fetchFromPageNumber:(NSNumber *)thePageNumber
         withDoingAtSuccess:(SuccessWithModelCollection)callback;

/**
 *  Fetch the objects for the next page,
 *  if the property null for the instance is not null.
 *
 *  @return an array of class objects
 */
-(void) fetchNextWithSuccess:(SuccessWithModelCollection)success;

/**
 *  Fetch the objects for the previous page,
 *  if the property null for the instance is not null.
 *
 *  @return an array of class objects
 */
-(void) fetchPreviousWithSuccess:(SuccessWithModelCollection)success;

@end