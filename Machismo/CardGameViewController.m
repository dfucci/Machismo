//
//  CardGameViewController.m
//  Machismo
//
//  Created by Davide on 30/01/14.
//  Copyright (c) 2014 Davide. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numberOfCardsPicker;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong, nonatomic)CardMatchingGame *game;
@end

@implementation CardGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchCardButton:(UIButton *)sender {
    self.numberOfCardsPicker.enabled = NO;
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];

}

-(void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLable.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
    
}

-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


-(CardMatchingGame *) game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}
- (IBAction)touchReadButton:(UIButton *)sender {
    [self resetScoreLabel];
    self.game = Nil;
    self.numberOfCardsPicker.enabled=YES;
    [self updateUI];
}

-(void)resetScoreLabel
{
    self.scoreLable.text = @"Score: 0";
}


- (IBAction)gameSelectionChanged:(id)sender {
    
    if (self.numberOfCardsPicker.selectedSegmentIndex == 0) {
        NSLog(@"First");
    } else if (self.numberOfCardsPicker.selectedSegmentIndex == 1) {
        NSLog(@"Second");
    }
}
@end
