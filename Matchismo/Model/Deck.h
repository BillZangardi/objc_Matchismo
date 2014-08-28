//
//  Deck.h
//  Matchismo
//
//  Created by Zangardi, William (ELS-PHI) on 8/12/14.
//  Copyright (c) 2014 Zangardi, William (ELS-PHI). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
