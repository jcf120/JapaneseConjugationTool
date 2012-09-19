//
//  FuriganaTests.m
//  JapaneseFlashCards
//
//  Created by Jocelyn Clifford-Frith on 19/09/2012.
//  Copyright (c) 2012 Jocelyn Clifford-Frith. All rights reserved.
//

#import "FuriganaTests.h"

@implementation FuriganaTests

+ (NSArray *)validMarkedStrings
{
    return [NSArray arrayWithObjects:
            @"「食（た）べる」",
            nil];
}

- (void)testCreate
{
    for (NSString *validMarkedString in [FuriganaTests validMarkedStrings]) {
        Furigana *f = [[Furigana alloc] initWithMarkedString:validMarkedString];
        STAssertNotNil(f, @"Furigana failed to instantiate from the valif string '%@'",f);
    }
}

@end
