//
//  PlayingCard.h
//  Machismo
//
//  Created by Davide on 31/01/14.
//  Copyright (c) 2014 Davide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end
