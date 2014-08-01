//
//  TMDBillAmount.h
//  TipCalculator
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDBillAmount : NSObject

@property double billAmount;


- (double)calculatePercentageTip:(double)tipPercentage forAmount:(double)amount;

- (double)calculateTotalBillAmountWitTip:(double)tipPercentage originalBillAmount:(double)amount;


@end
