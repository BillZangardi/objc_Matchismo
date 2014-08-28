//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Zangardi, William (ELS-PHI) on 8/20/14.
//  Copyright (c) 2014 Zangardi, William (ELS-PHI). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;



@end
