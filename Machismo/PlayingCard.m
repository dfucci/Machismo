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
        score = [self calculateScoreBeetween:self secondCard:otherCard];
       
    }
    
    if ([otherCards count] == 2) {
        PlayingCard *firstCard = [otherCards firstObject];
        PlayingCard *secondCard = [otherCards objectAtIndex:1];
        score = [self calculateScoreBeetween:self secondCard:firstCard] + [self calculateScoreBeetween:self secondCard:secondCard] + [self calculateScoreBeetween:firstCard secondCard:secondCard];
    }
    return score;
}

-(int)calculateScoreBeetween:(PlayingCard *)firstCard secondCard:(PlayingCard *)secondCard
{
    int score=0;
    if (firstCard.rank == secondCard.rank) {
        score = 4;
    }
    else if ([firstCard.suit isEqualToString:secondCard.suit]) {
        score = 1;
    }
    
    return score;
}
@end
