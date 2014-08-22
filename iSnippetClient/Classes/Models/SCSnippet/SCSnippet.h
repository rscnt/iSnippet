//
//  SCSnippet.h
//  iSnippetClient
//
//  Created by Raul Ascencio on 8/22/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "SCModelDetailed.h"

@interface SCSnippet : SCModelDetailed

/**
 Syntax highlight used for the snippet.
 */
typedef enum SnippetLanguage {
    Cucumber, //Cucumber
    AppleScript, //applescript
    Brainfuck, //brainfuck
    
} anSnippetLanguage;

/**
 * Colors for the snippet.
 */
typedef enum SnippetStyle {
    Borland, //borland
    Emacs, //emacs
    Monokai, //monokai
} anSnippetStyle;


@property (strong, nonatomic        ) NSString *title;
@property (strong, nonatomic        ) NSString *code;
@property (strong, nonatomic        ) NSString *language;
@property (strong, nonatomic        ) NSString *style;
@property (nonatomic                ) BOOL     lineOS;

/**
 *  Recives an enumartion value and returns an string value.
 *
 *  @param snippetLanguage the enum value for the snippet language.
 *
 *  @return an string for the snippet value.
 */
+ (NSString *)getSnippetLanguageBy:(anSnippetLanguage)snippetLanguage;

/**
 *  Recives an enumartion value and returns an string value.
 *
 *  @param snippetLanguage the enum value for the snippet style.
 *
 *  @return an string for the snippet value.
 */
+ (NSString *)getSnippetStyleBy:(anSnippetStyle)snippetStyle;

/**
 *  Creates and instance for the snippet and publish it to the server.
 *
 *  @param title       the title of the snippet
 *  @param theCode     the code of the snippet
 *  @param theLanguage the language for highlight the snippet
 *  @param theStyle    the style of the snippet
 *  @param usingLineOS if we should use lineos
 *
 *  @return a boolean, should be an snippet
 */
- (instancetype) initSnippetWithTitle:(NSString *)title
                              theCode:(NSString *)theCode
                          theLanguage:(anSnippetLanguage)theLanguage
                            withStyle:(anSnippetStyle)theStyle
                       andUsingLineOS:(BOOL)usingLineOS;

/**
 *  Update and snippet
 *
 *  @param title       title description
 *  @param theCode     code of the code
 *  @param theLanguage language
 *  @param withStyle   with some style
 *  @param usingLineOS using lineos
 *
 *  @return self
 */
- (instancetype) updateSnippetWithTitle:(NSString *)title
                                theCode:(NSString *)theCode
                            theLanguage:(NSString *)theLanguage
                              withStyle:(NSString *)withStyle
                         andUsingLineOS:(BOOL)usingLineOS;

@end