//
//  SCSnippetsViewModel.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSnippetsViewModel.h"

@implementation SCSnippetsViewModel

-(void) setThisViewModel
{
    if (_snippets.count) {
        _textTitle = [NSString stringWithFormat:@"Snippets %@", _snippets.count];
    } else {
        _textTitle = @"Snippets";
    }
}

-(instancetype)initWithCallback:(void (^)(SCSnippetsViewModel *))aCallback
{
    self = [super init];
    if (self) {
        _snippets = [[SCSnippets alloc] init];
        [_snippets fetchWithSuccess:^(SCModelCollection* snippets){
            [self setThisViewModel];
            aCallback(self);
        }];
    }
    return self;
}

-(instancetype)initWithSnippets:(SCSnippets *)snippets
{
    self = [[SCSnippetsViewModel alloc] init];
    if (self) {
        _snippets = snippets;
        [self setThisViewModel];
    }
    return self;
};

@end