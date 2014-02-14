//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Davide on 11/02/14.
//  Copyright (c) 2014 Davide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
@property (nonatomic) NSUInteger cardsToMatch;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger lastScore;
@property (nonatomic, readonly) NSArray *lastChosenCards;
@end
