//
//  JapaneseVerbTests.m
//  JapaneseFlashCards
//
//  Created by Jocelyn Clifford-Frith on 31/08/2012.
//  Copyright (c) 2012 Jocelyn Clifford-Frith. All rights reserved.
//

#import "JapaneseVerbTests.h"

@implementation JapaneseVerbTests

- (void)setUp
{
    [super setUp];
    japaneseVerb = [[JapaneseVerb alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)setVerbToTaberu
{
    japaneseVerb.dictionaryForm = @"たべる";
    japaneseVerb.conjugationType = JapaneseVerbConjugationIchidan;
}

- (void)setVerbToNomu
{
    japaneseVerb.dictionaryForm = @"のむ";
    japaneseVerb.conjugationType = JapaneseVerbConjugationGodan;
}

- (void)testStem
{
    [self setVerbToTaberu];
    NSString *stem = [japaneseVerb stem];
    STAssertEqualObjects(stem, @"たべ", @"Verb stem should equal 'たべ', but intead equals '%@'.",stem);
}

- (void)testEnding
{
    [self setVerbToTaberu];
    NSString *ending = [japaneseVerb ending];
    STAssertEqualObjects(ending, @"る", @"Verb stem should equal 'る', but intead equals '%@'.",ending);
}

- (void)testIchidanBase1
{
    [self setVerbToTaberu];
    NSString *base1 = [japaneseVerb base1];
    STAssertEqualObjects(base1, @"たべ", @"Verb stem should equal 'たべ', but intead equals '%@'.",base1);
}

- (void)testGodanBase1
{
    [self setVerbToNomu];
    NSString *base1 = [japaneseVerb base1];
    STAssertEqualObjects(base1, @"の", @"Verb stem should equal 'の', but intead equals '%@'.",base1);
}

@end

