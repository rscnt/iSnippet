//
//  SCModel.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

static const NSString *host = @"http://127.0.0.1:8000";
static const NSString *endpoint = @"/";

@protocol SCEndPoint

/**
 *  This message returns the name of the first 
 *  namespace for the model.
 *  For example in: api.org/foo/bar, the namespace
 *  here is "foo".
 *
 *  @return an string with the namespace
 */
-(NSString *) namespace;


@end

/**
 *  This class is supposed to be abstract so please
 *      use it as an abstract class.
 *  Derivates from MTLModel, and use the protocol
 *      MTLJsonSerializing.
 */
@interface SCModel : MTLModel <MTLJSONSerializing, SCEndPoint>

#pragma mark Static messages.

/**
 *  The endpoint to the api
 *
 *  @return the url for the api endpoint.
 */
+(NSString *) getApiEndPointUrl;

/**
 *  The value of the endpoint url for a model.
 *
 *  @return the url for the model endpoint.
 */
+(NSString *) getModelEndPointUrl;

/**
 *  Auth end point for the api.
 *
 *  @return an url.
 */
+(NSString *) getAuthEndPointUrl;

#pragma mark Instance messages.
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

/**
 *  Returns the object as a dictionary
 *
 *  @return a dictionary with the object value
 */
- (NSDictionary *) asDictionary;

/**
 *  Set the instance from the values given 
 *  by the dictionary.
 *
 *  @return the instance.
 */
- (instancetype) fromDictionary:(NSDictionary *)aDictionary;

@end