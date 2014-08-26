//
//  SCNotificationCenterManager.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/26/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCSharedNotificationManager : NSObject

/**
 *  This methods returns a shared notification center, aka: a singleton.
 *
 *  @return a NSNotificationCenter.
 */
- (NSNotificationCenter *) sharedNotificationCenter;

/**
 *  A shared notification queue.
 *
 *  @return a NSNotificationQueue.
 */
- (NSNotificationQueue *) sharedNotificationQueue;

@end
