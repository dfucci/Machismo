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
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck gameType:(NSString *)type;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@end
