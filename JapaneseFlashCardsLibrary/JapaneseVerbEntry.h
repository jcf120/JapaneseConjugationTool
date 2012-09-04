//
//  JapaneseVerbEntry.h
//  JapaneseFlashCards
//
//  Created by Jocelyn Clifford-Frith on 31/08/2012.
//  Copyright (c) 2012 Jocelyn Clifford-Frith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


typedef enum {
    JapaneseVerbConjugationIchidan = 0,
    JapaneseVerbConjugationGodan = 1
} JapaneseVerbConjugationType;

/** A JapaneseVerbEntry instance represents the JapaneseVerbEntry Entity for the Core Data Model. The instance is light weight and only intended for representing the data model. Any logic derived from the properties of a JapaneseVerbEntry intance is handled through a JapaneseVerb instance.
 
 The verb's conjugation type is stored as a NSNumber in the data model, but is intended to be accessed as a JapaneseVerbConjugationType enum.
 
 - JapaneseVerbConjugationIchidan: an Ichidan type verb, also known as a type 1 verb.
 - JapaneseVerbConjugationTypeGodan: a Godan type verb, also known as a type 2 verb.
 */


@interface JapaneseVerbEntry : NSManagedObject

/** The accessor for the dictionary form of the verb, which is equivalent to it's base3 conjugation.
 */
@property (nonatomic, retain) NSString * dictionaryForm;

/** This accessor is not attended for direct use, but is included to support any KVC calls.
 */
@property (nonatomic, retain) NSNumber * conjugationTypeNumber;

/** The intended method for accessing the instances conjugation type. Can by either Ichidan or Godan.
 */
@property (nonatomic, readwrite) JapaneseVerbConjugationType conjugationType;

@end
