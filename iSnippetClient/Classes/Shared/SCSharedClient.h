//
//  SCSharedClient.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/21/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@interface SCSharedClient :  AFHTTPSessionManager

/**
 *  Stores and instance of this object client.
 *
 *  @return an static instance of SCSharedClient.
 */
+(instancetype) sharedClient;

@end
