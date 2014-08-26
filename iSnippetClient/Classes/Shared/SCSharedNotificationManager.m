//
//  SCNotificationCenterManager.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/26/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSharedNotificationManager.h"

@implementation SCSharedNotificationManager


-(NSNotificationCenter *)sharedNotificationCenter
{
    static NSNotificationCenter *_notificationCenter;
    if ( ! _notificationCenter) {
        _notificationCenter = [NSNotificationCenter defaultCenter];
    }
    return _notificationCenter;
}

- (NSNotificationQueue *)sharedNotificationQueue
{
    static NSNotificationQueue *_notificationQueue;
    if ( ! _notificationQueue) {
        _notificationQueue = [[NSNotificationQueue alloc] initWithNotificationCenter:[self sharedNotificationCenter]];
    }
    return _notificationQueue;
}

@end
