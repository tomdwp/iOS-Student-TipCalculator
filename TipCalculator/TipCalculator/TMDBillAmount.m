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


- (double)calculatePercentageTip:(double)tipPercentage forAmount:(double)amount
{
    return ( amount * tipPercentage );
}


- (double)calculateTotalBillAmountWitTip:(double)tipPercentage originalBillAmount:(double)amount
{
    return ( amount +  (amount * tipPercentage) );
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%.2f", self.billAmount];
}

@end
