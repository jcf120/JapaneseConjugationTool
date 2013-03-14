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

#pragma mark Instantiation Methods

- (id)initWithDictionaryForm: (NSString *)verbString
{
    if (self = [super init]) {
        self.dictionaryForm = verbString;
        
        // Verb must as least two characters long
        if ([[self dictionaryForm] length]<2) {
            // Valid dictionary form
            [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"JapaneseVerbs can only be instantiated with a string of at least 2 characters, but was instead sent a string of length %i",[[self dictionaryForm] length]] userInfo:nil];
            
            self = nil;
        }
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
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)base2
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)base3
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)base4
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)base5
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)baseTe
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)baseTa
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}



@end



@implementation JapaneseIchidanVerb

- (id)initWithDictionaryForm:(NSString *)verbString
{
    if (self = [super initWithDictionaryForm:verbString]) {
        // Verb must end ru
        if (![[self ending] isEqual: @"る" ]){
            // Invalid verb ending
            [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"JapaneseIchidanVerb can only be instantiated with a string ending 'る', but was instead sent a string ending '%@'",[self ending]] userInfo:nil];
            self = nil;
        }
    }
    return self;
}

- (NSString *)base1
{
    return [self stem];
}

- (NSString *)base2
{
    return [self stem];
}

- (NSString *)base3
{
    return [self dictionaryForm];
}

- (NSString *)base4
{
    return [NSString stringWithFormat:@"%@%@", [self stem], @"れ"];
}

- (NSString *)base5
{
    return [NSString stringWithFormat:@"%@%@", [self stem], @"よう"];
}

- (NSString *)baseTe
{
    return [NSString stringWithFormat:@"%@%@", [self stem], @"て"];
}

- (NSString *)baseTa
{
    return [NSString stringWithFormat:@"%@%@", [self stem], @"た"];
}

@end


@implementation JapaneseGodanVerb

- (id)initWithDictionaryForm:(NSString *)verbString
{
    if (self = [super initWithDictionaryForm:verbString]) {
        // Verb must end one of the following: u, ku, gu, su, tsu, nu, bu, mu, ru
        NSString *e = [self ending];
        if (![e isEqualToString:@"う"] && ![e isEqualToString:@"く"] && ![e isEqualToString:@"ぐ"] && ![e isEqualToString:@"す"] && ![e isEqualToString:@"つ"] && ![e isEqualToString:@"ぬ"] && ![e isEqualToString:@"ぶ"] && ![e isEqualToString:@"む"] && ![e isEqualToString:@"る"]) {
            // Invalid verb ending
            [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"JapaneseIchidanVerb can only be instantiated with a string ending 'う', 'く', 'ぐ', 'す', 'つ', 'ぬ', 'ぶ', 'む' or 'る', but was instead sent a string ending '%@'", e] userInfo:nil];
            self = nil;
        }
    }
    return self;
}


- (NSString *)base1
{
    NSString *newEnding = nil;
    NSString *ending = [self ending];
    
    if      ([ending isEqual: @"う"])
        newEnding = @"わ";
    else if ([ending isEqual: @"く"])
        newEnding = @"か";
    else if ([ending isEqual: @"ぐ"])
        newEnding = @"が";
    else if ([ending isEqual: @"す"])
        newEnding = @"さ";
    else if ([ending isEqual: @"つ"])
        newEnding = @"た";
    else if ([ending isEqual: @"ぬ"])
        newEnding = @"な";
    else if ([ending isEqual: @"ぶ"])
        newEnding = @"ば";
    else if ([ending isEqual: @"む"])
        newEnding = @"ま";
    else if ([ending isEqual: @"る"])
        newEnding = @"ら";
    else {
        // Invalid Godan ending
        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"JapaneseGodanVerb has attempted conjugate base1 for the invalid ending '%@'",ending] userInfo:nil];
    }
    
    return [NSString stringWithFormat:@"%@%@",[self stem], newEnding];
}

- (NSString *)base2
{
    NSString *newEnding = nil;
    NSString *ending = [self ending];
    
    if      ([ending isEqual: @"う"])
        newEnding = @"い";
    else if ([ending isEqual: @"く"])
        newEnding = @"き";
    else if ([ending isEqual: @"ぐ"])
        newEnding = @"ぎ";
    else if ([ending isEqual: @"す"])
        newEnding = @"し";
    else if ([ending isEqual: @"つ"])
        newEnding = @"ち";
    else if ([ending isEqual: @"ぬ"])
        newEnding = @"に";
    else if ([ending isEqual: @"ぶ"])
        newEnding = @"び";
    else if ([ending isEqual: @"む"])
        newEnding = @"み";
    else if ([ending isEqual: @"る"])
        newEnding = @"り";
    else {
        // Invalid Godan ending
        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"JapaneseGodanVerb has attempted conjugate base2 for the invalid ending '%@'",ending] userInfo:nil];
    }
    
    return [NSString stringWithFormat:@"%@%@",[self stem], newEnding];
}

- (NSString *)base3
{
    return [self dictionaryForm];
}

- (NSString *)base4
{
    NSString *newEnding = nil;
    NSString *ending = [self ending];
    
    if      ([ending isEqual: @"う"])
        newEnding = @"え";
    else if ([ending isEqual: @"く"])
        newEnding = @"け";
    else if ([ending isEqual: @"ぐ"])
        newEnding = @"げ";
    else if ([ending isEqual: @"す"])
        newEnding = @"せ";
    else if ([ending isEqual: @"つ"])
        newEnding = @"て";
    else if ([ending isEqual: @"ぬ"])
        newEnding = @"ね";
    else if ([ending isEqual: @"ぶ"])
        newEnding = @"べ";
    else if ([ending isEqual: @"む"])
        newEnding = @"め";
    else if ([ending isEqual: @"る"])
        newEnding = @"れ";
    else {
        // Invalid Godan ending
        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"JapaneseGodanVerb has attempted conjugate base4 for the invalid ending '%@'",ending] userInfo:nil];
    }
    
    return [NSString stringWithFormat:@"%@%@",[self stem], newEnding];
}

- (NSString *)base5
{
    NSString *newEnding = nil;
    NSString *ending = [self ending];
    
    if      ([ending isEqual: @"う"])
        newEnding = @"おう";
    else if ([ending isEqual: @"く"])
        newEnding = @"こう";
    else if ([ending isEqual: @"ぐ"])
        newEnding = @"ごう";
    else if ([ending isEqual: @"す"])
        newEnding = @"そう";
    else if ([ending isEqual: @"つ"])
        newEnding = @"とう";
    else if ([ending isEqual: @"ぬ"])
        newEnding = @"のう";
    else if ([ending isEqual: @"ぶ"])
        newEnding = @"ぼう";
    else if ([ending isEqual: @"む"])
        newEnding = @"もう";
    else if ([ending isEqual: @"る"])
        newEnding = @"ろう";
    else {
        // Invalid Godan ending
        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"JapaneseGodanVerb has attempted conjugate base5 for the invalid ending '%@'",ending] userInfo:nil];
    }
    
    return [NSString stringWithFormat:@"%@%@",[self stem], newEnding];
}

- (NSString *)baseTe
{
    NSString *newEnding = nil;
    NSString *ending = [self ending];
    
    if      ([ending isEqual: @"う"])
        newEnding = @"って";
    else if ([ending isEqual: @"く"])
        newEnding = @"いて";
    else if ([ending isEqual: @"ぐ"])
        newEnding = @"いで";
    else if ([ending isEqual: @"す"])
        newEnding = @"して";
    else if ([ending isEqual: @"つ"])
        newEnding = @"って";
    else if ([ending isEqual: @"ぬ"])
        newEnding = @"んで";
    else if ([ending isEqual: @"ぶ"])
        newEnding = @"んて";
    else if ([ending isEqual: @"む"])
        newEnding = @"んで";
    else if ([ending isEqual: @"る"])
        newEnding = @"って";
    else {
        // Invalid Godan ending
        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"JapaneseGodanVerb has attempted conjugate baseTe for the invalid ending '%@'",ending] userInfo:nil];
    }
    
    return [NSString stringWithFormat:@"%@%@",[self stem], newEnding];
}

- (NSString *)baseTa
{
    NSString *newEnding = nil;
    NSString *ending = [self ending];
    
    if      ([ending isEqual: @"う"])
        newEnding = @"った";
    else if ([ending isEqual: @"く"])
        newEnding = @"いた";
    else if ([ending isEqual: @"ぐ"])
        newEnding = @"いだ";
    else if ([ending isEqual: @"す"])
        newEnding = @"した";
    else if ([ending isEqual: @"つ"])
        newEnding = @"った";
    else if ([ending isEqual: @"ぬ"])
        newEnding = @"んだ";
    else if ([ending isEqual: @"ぶ"])
        newEnding = @"んた";
    else if ([ending isEqual: @"む"])
        newEnding = @"んだ";
    else if ([ending isEqual: @"る"])
        newEnding = @"った";
    else {
        // Invalid Godan ending
        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"JapaneseGodanVerb has attempted conjugate baseTe for the invalid ending '%@'",ending] userInfo:nil];
    }
    
    return [NSString stringWithFormat:@"%@%@",[self stem], newEnding];
}

@end
