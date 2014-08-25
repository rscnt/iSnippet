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

@property (readonly, nonatomic) SCSnippets *snippets;
@property (readonly, nonatomic) NSString   *textTitle;

@end
