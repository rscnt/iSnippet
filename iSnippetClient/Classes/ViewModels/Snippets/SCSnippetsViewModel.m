//
//  SCSnippetsViewModel.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSnippetsViewModel.h"

@implementation SCSnippetsViewModel

-(instancetype)init
{
    self = [super init];
    if (self) {
        /*
         * Init the snippets model and fetch
         * the results on the server.
         */
        _snippets = [[SCSnippets alloc] init];
        [_snippets fetch];
    }
    return self;
}

-(instancetype)initWithSnippets:(SCSnippets *)snippets
{
    self = [[SCSnippetsViewModel alloc] init];
    if (self) {
        _snippets = snippets;
        if (_snippets.count) {
            _textTitle = [NSString stringWithFormat:@"Snippets %@", _snippets.count];
        } else {
            _textTitle = @"Snippets";
        }
    }
    return self;
};

@end