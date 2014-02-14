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
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"T",@"J",@"Q",@"K"];
}


- (int)match:(NSArray *)otherCards
{
    int score = 0;
    int numOtherCards = [otherCards count];
    
    if (numOtherCards) {
        for (Card *card in otherCards) {
            if ([card isKindOfClass:[PlayingCard class]]) {
                PlayingCard *otherCard = (PlayingCard *)card;
                if ([self.suit isEqualToString:otherCard.suit]) {
                    score += 1;
                } else if (self.rank == otherCard.rank) {
                    score += 4;
                }
            }
        }
    }
    if (numOtherCards > 1) {
        score += [[otherCards firstObject] match:[otherCards subarrayWithRange:NSMakeRange(1, numOtherCards - 1)]];
    }
    return score;
}


@end
