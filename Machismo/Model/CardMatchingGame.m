//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Davide on 11/02/14.
//  Copyright (c) 2014 Davide. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@property (nonatomic, readwrite) NSInteger lastScore;
@property (nonatomic, strong) NSArray *lastChosenCards;
@end
@implementation CardMatchingGame
-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}
//-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck gameType:(NSString*)type{
//    self = [self initWithCardCount:count usingDeck:deck];
//    _gameType = type;
//    return self;
//    
//}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}
-(NSUInteger) cardsToMatch
{
    if (_cardsToMatch < 2) {
        _cardsToMatch = 2;
    }
    return  _cardsToMatch;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index]:nil;
}
static const int MISMATCH_PENALITY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *otherCards = [NSMutableArray array];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                }
            }
            self.lastScore = 0;
            self.lastChosenCards = [otherCards arrayByAddingObject:card];
            if ([otherCards count] + 1 == self.cardsToMatch) {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    self.lastScore = matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.matched = YES;
                    }
                } else {
                    self.lastScore = - MISMATCH_PENALITY;
                    for (Card *otherCard in otherCards) {
                        otherCard.chosen = NO;
                    }
                }
            }
            self.score += self.lastScore - COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
