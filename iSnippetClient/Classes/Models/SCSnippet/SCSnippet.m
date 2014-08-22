//
//  SCSnippet.m
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCSnippet.h"
#import "SCSharedClient.h"

@implementation SCSnippet

+ (NSString *)namespace
{
    return @"snippets";
}

# pragma mark getters

+ (NSString *)getSnippetLanguageBy:(anSnippetLanguage)snippetLanguage
{
    NSString *value;
    switch (snippetLanguage) {
        case AppleScript:
            value = @"applescript";
            break;
        case Brainfuck:
            value = @"brainfuck";
            break;
        case Cucumber:
            value = @"Cucumber";
            break;
        default:
            value = @"python";
            break;
    }
    return value;
};

+(NSString *)getSnippetStyleBy:(anSnippetStyle)snippetStyle
{
    NSString *value;
    switch (snippetStyle) {
        case Borland:
            value = @"borland";
            break;
        case Emacs:
            value = @"emacs";
            break;
        case Monokai:
            value = @"monokai";
            break;
        default:
            value = @"emacs";
            break;
    }
    return value;
}

# pragma mark instance methods

- (instancetype)initSnippetWithTitle:(NSString *)title
                             theCode:(NSString *)theCode
                         theLanguage:(anSnippetLanguage)theLanguage
                           withStyle:(anSnippetStyle)theStyle
                      andUsingLineOS:(BOOL)usingLineOS
                          forTheUser:(SCUser *)theUser
{
    
    
    // Settings the object.
    self          = [super init];
    if (self) {
        self.title    = title;
        self.code     = theCode;
        self.language = [SCSnippet getSnippetLanguageBy:theLanguage];
        self.style    = [SCSnippet getSnippetStyleBy:theStyle];
        self.owner    = theUser.username;
        self.lineOS   = usingLineOS;
    }
    [[SCSharedClient sharedClient]
     POST:[SCSnippet getModelEndPointUrl]
     parameters:[self asDictionary]
     constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
    {
        //idk what this shit does.
    }
     success:^(NSURLSessionDataTask *task, id responseObject)
    {
        //set the new properties.
        [self fromDictionary:responseObject];
    }
     failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        //TODO: show error for init snippet with title.
    }];
    return self;
}

-(instancetype)updateSnippetWithTitle:(NSString *)title
                              theCode:(NSString *)theCode
                          theLanguage:(NSString *)theLanguage
                            withStyle:(NSString *)withStyle
                       andUsingLineOS:(BOOL)usingLineOS
{
    [[SCSharedClient sharedClient]
     PUT:[self getInstanceUrl]
     parameters:[self asDictionary]
     success:^(NSURLSessionDataTask *task, id responseObject)
    {
        [self fromDictionary:responseObject];
    }
     failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        //TODO: show error for update snippet with title.
    }];
    return self;
}
@end