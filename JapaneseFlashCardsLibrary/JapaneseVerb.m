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
        if ([self ending] != @"る") {
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
    
    if      (ending == @"う")
        newEnding = @"わ";
    else if (ending == @"く")
        newEnding = @"か";
    else if (ending == @"ぐ")
        newEnding = @"が";
    else if (ending == @"す")
        newEnding = @"さ";
    else if (ending == @"つ")
        newEnding = @"た";
    else if (ending == @"ぬ")
        newEnding = @"な";
    else if (ending == @"ぶ")
        newEnding = @"ば";
    else if (ending == @"む")
        newEnding = @"ま";
    else if (ending == @"る")
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
    
    if      (ending == @"う")
        newEnding = @"い";
    else if (ending == @"く")
        newEnding = @"き";
    else if (ending == @"ぐ")
        newEnding = @"ぎ";
    else if (ending == @"す")
        newEnding = @"し";
    else if (ending == @"つ")
        newEnding = @"ち";
    else if (ending == @"ぬ")
        newEnding = @"に";
    else if (ending == @"ぶ")
        newEnding = @"び";
    else if (ending == @"む")
        newEnding = @"み";
    else if (ending == @"る")
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
    
    if      (ending == @"う")
        newEnding = @"え";
    else if (ending == @"く")
        newEnding = @"け";
    else if (ending == @"ぐ")
        newEnding = @"げ";
    else if (ending == @"す")
        newEnding = @"せ";
    else if (ending == @"つ")
        newEnding = @"て";
    else if (ending == @"ぬ")
        newEnding = @"ね";
    else if (ending == @"ぶ")
        newEnding = @"べ";
    else if (ending == @"む")
        newEnding = @"め";
    else if (ending == @"る")
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
    
    if      (ending == @"う")
        newEnding = @"おう";
    else if (ending == @"く")
        newEnding = @"こう";
    else if (ending == @"ぐ")
        newEnding = @"ごう";
    else if (ending == @"す")
        newEnding = @"そう";
    else if (ending == @"つ")
        newEnding = @"とう";
    else if (ending == @"ぬ")
        newEnding = @"のう";
    else if (ending == @"ぶ")
        newEnding = @"ぼう";
    else if (ending == @"む")
        newEnding = @"もう";
    else if (ending == @"る")
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
    
    if      (ending == @"う")
        newEnding = @"って";
    else if (ending == @"く")
        newEnding = @"いて";
    else if (ending == @"ぐ")
        newEnding = @"いで";
    else if (ending == @"す")
        newEnding = @"して";
    else if (ending == @"つ")
        newEnding = @"って";
    else if (ending == @"ぬ")
        newEnding = @"んで";
    else if (ending == @"ぶ")
        newEnding = @"んて";
    else if (ending == @"む")
        newEnding = @"んで";
    else if (ending == @"る")
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
    
    if      (ending == @"う")
        newEnding = @"った";
    else if (ending == @"く")
        newEnding = @"いた";
    else if (ending == @"ぐ")
        newEnding = @"いだ";
    else if (ending == @"す")
        newEnding = @"した";
    else if (ending == @"つ")
        newEnding = @"った";
    else if (ending == @"ぬ")
        newEnding = @"んだ";
    else if (ending == @"ぶ")
        newEnding = @"んた";
    else if (ending == @"む")
        newEnding = @"んだ";
    else if (ending == @"る")
        newEnding = @"った";
    else {
        // Invalid Godan ending
        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"JapaneseGodanVerb has attempted conjugate baseTe for the invalid ending '%@'",ending] userInfo:nil];
    }
    
    return [NSString stringWithFormat:@"%@%@",[self stem], newEnding];
}

@end
