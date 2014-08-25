//
//  SCSnippetViewModel.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCSnippet.h"

@interface SCSnippetViewModel : NSObject

/**
 *  Initializes this view model with an snippet object.
 *
 *  @param theSnippet Instance of SCSnippet.
 *
 *  @return a new instance of SCSnippetViewModel
 */
-(instancetype) initWithSnippet:(SCSnippet *)theSnippet;

@property (readonly, nonatomic) SCSnippet *snippet;
@property (readonly, nonatomic) NSString  *textTitle;

@end
