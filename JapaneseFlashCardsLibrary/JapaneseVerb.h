//
//  JapaneseVerb.h
//  JapaneseFlashCards
//
//  Created by Jocelyn Clifford-Frith on 31/08/2012.
//  Copyright (c) 2012 Jocelyn Clifford-Frith. All rights reserved.
//

#import <Foundation/Foundation.h>

/** `JapaneseVerb` is an abstract class that is subclassed to follow specific conjugation rules (see `JapaneseGodanVerb` and `JapaneseIchidanVerb`).
 
 Verb data is held using Core Data with a `JapaneseVerbEntry` `NSManagedObject` subclass instance. to avoid bloating the class and to allow instantiation independly of Core Data, all verb logic has been pushed `JapaneseVerb`.
 
 */

@interface JapaneseVerb : NSObject
    
@property (nonatomic, retain) NSString *dictionaryForm;

/**
 * @name Instantiation
 */

/** Instantiates a `JapaneseVerb` with a specified dictionary form. This method is subclassed for verb type validation.
 
 A `JapaneseVerb`'s `dictionaryForm` must be at least two characters long.
 
 @param verbString An `NSString` containing the dictionary form for the new verb.
 @return an instantiated JapaneseVerb with a `dictionaryForm` of `verbString`.
 */
- (id)initWithDictionaryForm: (NSString *)verbString;

/**
 * @name Verb Conjugation
 */

/** Returns the stem of the verb.
 
 The stem is formed from the dictionary form of the verb with final hiragan character removed.
 
 @return An NSString containing the verb stem.
 */
- (NSString *)stem;

/** Returns the verb ending.
 
 The verb ending is formed from the final hiragana character of the dictionary form of the verb.
 
 @return An NSString containing the verb ending hiragana character.
 */
- (NSString *)ending;



/** Throws `NSInternalInconsistencyException`. Intended for subclassing.
 */
- (NSString *)base1;

/** Throws `NSInternalInconsistencyException`. Intended for subclassing.
 */
- (NSString *)base2;

/** Throws `NSInternalInconsistencyException`. Intended for subclassing.
 */
- (NSString *)base3;

/** Throws `NSInternalInconsistencyException`. Intended for subclassing.
 */
- (NSString *)base4;

/** Throws `NSInternalInconsistencyException`. Intended for subclassing.
 */
- (NSString *)base5;

/** Throws `NSInternalInconsistencyException`. Intended for subclassing.
 */
- (NSString *)baseTe;

/** Throws `NSInternalInconsistencyException`. Intended for subclassing.
 */
- (NSString *)baseTa;

@end

/** A subclass of `JapaneseVerb` that returns its conjugations according the the patterns of an Ichidan verb.
 */

@interface JapaneseIchidanVerb : JapaneseVerb
/** Returns the base1 form of the verb.
 
 The base1 form of an Ichidan verb is simply equivalent to it's `stem`.
 
 @return An NSString containing the base1 form of the verb.
 */
- (NSString *)base1;

/** Returns the base2 form of the verb.
 
 The base2 form of an Ichidan verb is equvalent to it's stem.
 
 @return An NSString containing the base2 form of the verb.
 */
- (NSString *)base2;

/** Returns the base3 form of the verb.
 
 The base3 form of the verb is equivalent to it's dictionaryForm.
 
 @return An NSString containing the base3 form of the verb.
 */
- (NSString *)base3;

/** Returns the base4 form of the verb.
 
 The base4 form of an Ichidan verb is made by appending the hiragana character 'れ' to the verb's stem.
 
 @return An NSString containing the base4 form of the verb.
 */
- (NSString *)base4;

/** Returns the base5 form of the verb.
 
 The base5 form of an Ichidan verb is made by appending the hiragana character 'よう' to the verb's stem.
 
 @return An NSString containing the base5 form of the verb.
 */
- (NSString *)base5;

/** Returns the baseTe form of the verb.
 
 @return An NSString containing the baseTe form of the verb.
 */
- (NSString *)baseTe;

/** Returns the baseTa form of the verb.
 
 @return An NSString containing the baseTa form of the verb.
 */
- (NSString *)baseTa;
@end

/** A subclass of `JapaneseVerb` that returns its conjugations according the the patterns of an Godan verb.
 */

@interface JapaneseGodanVerb : JapaneseVerb
/** Returns the base1 form of the verb.
 
 The base1 form of a verb is formed by translating the final hiragana character from the \_u column to the \_a column. Verbs ending 'う' are an exception and are instead transformed to 'わ'.
 
 @return An NSString containing the base1 form of the verb.
 */
- (NSString *)base1;

/** Returns the base2 form of the verb.
 
 For Godan verbs the base2 form is made by translating the final hiragana character from the \_u column to the \_i column.
 
 @return An NSString containing the base2 form of the verb.
 */
- (NSString *)base2;

/** Returns the base3 form of the verb.
 
 The base3 form of the verb is equivalent to it's dictionaryForm.
 
 @return An NSString containing the base3 form of the verb.
 */
- (NSString *)base3;

/** Returns the base4 form of the verb.
 
 For Godan verbs the base4 form is made by translating the final hiragana character from the \_u column to the \_e column.
 
 @return An NSString containing the base4 form of the verb.
 */
- (NSString *)base4;

/** Returns the base5 form of the verb.
 
 For Godan verbs the base5 is formed by translating the final hiragana character from the \_u column to the \_o column and appending an 'う'.
 
 @return An NSString containing the base5 form of the verb.
 */
- (NSString *)base5;

/** Returns the baseTe form of the verb.
 
 @return An NSString containing the baseTe form of the verb.
 */
- (NSString *)baseTe;

/** Returns the baseTa form of the verb.
 
 @return An NSString containing the baseTa form of the verb.
 */
- (NSString *)baseTa;
@end
