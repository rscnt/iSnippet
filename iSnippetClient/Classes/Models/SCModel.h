//
//  SCModel.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * This class is supposed to be abstract so please
 * use it as an abstract class.
 */
@interface SCModel : NSObject

/**
 *  Base method to fetch from a remote
 *  server.
 *
 *  @param withParameters parameters to send
 *
 *  @return model instance type.
 */
-(instancetype) get:(NSObject *)withParameters;

/**
 *  Base method to publish to the server.
 *
 *  @param withParamters parameters to send.
 *
 *  @return a model instance type.
 */
-(instancetype) post:(NSObject *)withParamters;

@end
