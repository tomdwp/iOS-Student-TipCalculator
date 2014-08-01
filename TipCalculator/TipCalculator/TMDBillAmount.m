//
//  TMDBillAmount.m
//  TipCalculator
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDBillAmount.h"

@implementation TMDBillAmount

// designated initializer
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        // set up
        
    }
    
    return self;
}


- (double)calculatePercentageTip:(double)tipPercentage
{
    return ( self.originalBillAmount * tipPercentage );
}


- (double)calculateTotalBillAmountWitTip:(double)tipPercentage
{
    return ( self.originalBillAmount +  (self.originalBillAmount * tipPercentage) );
}

- (NSString *)formatCalculationOfTip:(double)tipPercentage
{
    return [NSString stringWithFormat:@"%.2f", [self  calculatePercentageTip:tipPercentage]];
}

- (NSString *)formatCalculationOfTotalBillWitTip:(double)tipPercentage
{
    return [NSString stringWithFormat:@"%.2f", [self calculateTotalBillAmountWitTip:tipPercentage]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%.2f", self.originalBillAmount];
}

@end
