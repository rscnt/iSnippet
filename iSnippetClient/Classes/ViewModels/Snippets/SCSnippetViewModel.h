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
 *  A typedef to declare a new block callback with the new.
 *
 *
 *  @param theSnippet an scsnippet returned from init with fetching.
 */
typedef void (^SnippetWithSuccess)(SCSnippet *theSnippet);

/**
 *  Initializes this view model with an snippet object.
 *
 *  @param theSnippet Instance of SCSnippet.
 *
 *  @return a new instance of SCSnippetViewModel
 */
-(instancetype) initWithSnippet:(SCSnippet *)theSnippet;

-(instancetype) initWithCallback:(SCSnippet *)theSnippet;

@property (readonly, nonatomic) SCSnippet *snippet;
@property (readonly, nonatomic) NSString  *textTitle;

@end
