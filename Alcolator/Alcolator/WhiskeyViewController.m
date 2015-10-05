//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Robert von Stange on 10/4/15.
//  Copyright (c) 2015 Robert von Stange. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass*alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer*numberOfBeers;
    
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    }
    else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    //WINE
    float ouncesInOneWhiskeyGlass = 1;
    float alcoholPercentageOfWhiskey = 0.4;
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass*alcoholPercentageOfWhiskey;
    float numberofWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal/ouncesOfAlcoholPerWhiskeyGlass;
    NSString *whiskeyText;
    if (numberofWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"glass", @"singular glass");
    }
    else {
        whiskeyText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much as alcohol as %.1f %@ of whiskey", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberofWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
}


@end
