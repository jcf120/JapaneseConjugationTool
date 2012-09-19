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
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCreationFailure
{
    JapaneseVerb *jv = [[JapaneseVerb alloc] initWithDictionaryForm:@"食べる"];
    STAssertNil(jv, @"JapaneseVerb is an abstract class and instantiation should fail.");
}

@end


@implementation JapaneseGodanVerbTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

+ (NSArray *)validVerbStrings
{
    return [NSArray arrayWithObjects:
            @"会う",
            @"書く",
            @"泳ぐ",
            @"話す",
            @"持つ",
            @"死ぬ",
            @"飛ぶ",
            @"飲む",
            @"要る",
            nil];
}

- (void)testCreate
{
    // Test initialisation for the following valid dictionary forms.
    NSArray *validVerbStrings = [JapaneseGodanVerbTests validVerbStrings];
    JapaneseGodanVerb *jgv = nil;
    for (NSString *verbString in validVerbStrings) {
        jgv = [[JapaneseGodanVerb alloc] initWithDictionaryForm:verbString];
        STAssertNotNil(jgv, @"Failed to create JapaneseGodanVerb with dictionary form '%@'",verbString);
        jgv = nil;
    }
    
    // Test intialisation failure for the following invalid dictionary forms.
    NSArray *invalidVerbStrings = [NSArray arrayWithObjects:@"たべふ", nil];
    jgv = nil;
    for (NSString *verbString in invalidVerbStrings) {
        jgv = [[JapaneseGodanVerb alloc] initWithDictionaryForm:verbString];
        STAssertNil(jgv, @"Created JapaneseGodanVerb with invalid dictionary form '%@'",verbString);
        jgv = nil;
    }
}

@end
