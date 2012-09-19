//
//  JapaneseVerbEntry.m
//  JapaneseFlashCards
//
//  Created by Jocelyn Clifford-Frith on 31/08/2012.
//  Copyright (c) 2012 Jocelyn Clifford-Frith. All rights reserved.
//

#import "JapaneseVerbEntry.h"


@implementation JapaneseVerbEntry

@dynamic dictionaryForm;
@dynamic conjugationTypeNumber;


#pragma mark Conjugation Type Accessors
//
// Core data doesn't store enums directly, so use accessors that don't
// interfere/overwrite with the existing KVO methods.
//

- (JapaneseVerbConjugationType)conjugationType
{
    return (JapaneseVerbConjugationType)[self.conjugationTypeNumber intValue];
}

- (void)setConjugationType:(JapaneseVerbConjugationType)conjugationType
{
    self.conjugationTypeNumber = [NSNumber numberWithInt:conjugationType];
}


// Any updates to conjugationType should invoke conjugationTypeNumber.
+ (NSSet *)keyPathsForValuesAffectingConjugationType
{
    return [NSSet setWithObject:@"conjugationTypeNumber"];
}

#pragma mark Factory Methods

- (JapaneseVerb *)japaneseVerb
{
    JapaneseVerb *verb = nil;
    if (self.conjugationType == JapaneseVerbConjugationIchidan)
        verb = [[JapaneseIchidanVerb alloc] init];
    else if (self.conjugationType == JapaneseVerbConjugationGodan)
        verb = [[JapaneseGodanVerb alloc] init];
    return verb;
}

@end
