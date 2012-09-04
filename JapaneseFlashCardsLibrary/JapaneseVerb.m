//
//  JapaneseVerb.m
//  JapaneseFlashCards
//
//  Created by Jocelyn Clifford-Frith on 31/08/2012.
//  Copyright (c) 2012 Jocelyn Clifford-Frith. All rights reserved.
//

#import "JapaneseVerb.h"

@implementation JapaneseVerb


@synthesize dictionaryForm = _dictionaryForm;
@synthesize conjugationType = _conjugationType;

- (id)initFromJapaneseVerbEntry: (JapaneseVerbEntry *)entry
{
    if (self = [super init]) {
        self.dictionaryForm = entry.dictionaryForm;
        self.conjugationType = entry.conjugationType;
    }
    return self;
}

#pragma mark Conjugation Methods

- (NSString *)stem
{
    NSString *df = self.dictionaryForm;
    return [df substringToIndex:[df length]-1];
}

- (NSString *)ending
{
    NSString *df = self.dictionaryForm;
    return [df substringFromIndex:[df length]-1];
}

- (NSString *)base1
{
    return nil;
}

- (NSString *)base2
{
    return nil;
}

- (NSString *)base3
{
    return [self stem];
}

- (NSString *)base4
{
    return nil;
}

- (NSString *)base5
{
    return nil;
}

- (NSString *)baseTe
{
    return nil;
}

- (NSString *)baseTa
{
    return nil;
}



@end
