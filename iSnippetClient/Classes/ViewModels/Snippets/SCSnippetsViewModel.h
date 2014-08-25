//
//  SCSnippetsViewModel.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCSnippets.h"

@interface SCSnippetsViewModel : NSObject

-(instancetype) initWithSnippets:(SCSnippets *)snippets;
/**
 *  An horrible name for this function.
 *
 *  @param success A block that works like a callback when snippets are finalized.
 *
 *  @return self.
 */
-(instancetype) initWithCallback:(void (^)(SCSnippetsViewModel *snippetsViewModel) )aCallback;

/**
 *  A dummy function that set the properties of this View Model.
 */
-(void) setThisViewModel;

@property (readonly, nonatomic) SCSnippets *snippets;
@property (readonly, nonatomic) NSString   *textTitle;

@end
