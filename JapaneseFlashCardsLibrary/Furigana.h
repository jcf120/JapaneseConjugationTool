//
//  Furigana.h
//  JapaneseFlashCards
//
//  Created by Jocelyn Clifford-Frith on 17/09/2012.
//  Copyright (c) 2012 Jocelyn Clifford-Frith. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A `Furigana` instance serves as a container for an `NSString`. This raw string can hold hiragana and kanji marked up with the reading according to the following syntax:
 `「食（た）べる`
 `「A（B）C`
 where `A` is one or more kanji, `B` is the kanji's reading as one or more hiragana, and `C` is regular hiragana. A marked string is valid if all of the following rules are obeyed:
 
 - All kanji have been assigned readings
 - An open reading character '`「`' is terminated by a reading '`(B)`'
 */

@interface Furigana : NSObject

/**
 * @name Instantiation
 */


/** Instantiates a `Furigana` for a valid marked string.
 
 Returns nil for an invalid marked string. (See class discussion for details on validity).
 
 @param markedString An `NSString` containing kanji and hiragana according to the syntax specified in the class discussion.
 */
- (id)initWithMarkedString: (NSString *)markedString;

@end
