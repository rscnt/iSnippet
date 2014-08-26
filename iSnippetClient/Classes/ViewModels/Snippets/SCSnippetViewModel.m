//
//  SCSnippetViewModel.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSnippetViewModel.h"

@implementation SCSnippetViewModel

- (instancetype)initWithSnippet:(SCSnippet *)theSnippet
{
    _snippet = theSnippet;
    if (_snippet.title.length > 0) {
        _textTitle = [NSString stringWithFormat:@"%@ - %@",
                      [_snippet.title uppercaseString], _snippet.language];
    }
    return self;
}

- (instancetype)initWIthCallback:(void (^)(SCSnippetViewModel *snippetsViewModel) )aCallback
{
    self = [[SCSnippetViewModel alloc] init];
    if (self) {
        _snippet = [[SCSnippet alloc] init];
    }
    return self;
};

@end