//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Zangardi, William (ELS-PHI) on 8/11/14.
//  Copyright (c) 2014 Zangardi, William (ELS-PHI). All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
//@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck* cardDeck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}
/*
- (Deck*)cardDeck
{
    if (!_cardDeck){
        _cardDeck = [self createDeck];
    }
    
    return _cardDeck;
}
 */

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}
/*
- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Cards: %d",
                           self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}
*/
- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
    /*
    if ([sender.currentTitle length]) {
        UIImage *cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card* cardValue = [self.cardDeck drawRandomCard];
        if(cardValue){
            UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:cardValue.contents forState:UIControlStateNormal];
            //self.flipCount++;
        } else {
           
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Out of cards"
                                                           delegate:self
                                                  cancelButtonTitle:@"New Deck"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            _cardDeck = [self createDeck];
            //self.flipCount = 0;
        }
    
    }
     */

}
- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents: @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
