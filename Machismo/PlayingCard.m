//
//  PlayingCard.m
//  Machismo
//
//  Created by Davide on 31/01/14.
//  Copyright (c) 2014 Davide. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;
-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankString];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits
{
    return @[@"♦️",@"♥️",@"♠️",@"♣️"];
}
-(NSString *)suit{
    return _suit ? _suit : @"?";
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank =rank;
    }
}

+(NSUInteger) maxRank
{
    return [[self rankString] count]-1 ;
}

+(NSArray *)rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


-(int)match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count]==1)
    {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        }
        else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    }
    
    if ([otherCards count] == 2) {
        //TODO: do something
    }
    return score;
}
@end
