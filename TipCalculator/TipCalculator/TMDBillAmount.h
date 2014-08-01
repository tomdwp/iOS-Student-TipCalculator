//
//  TMDBillAmount.h
//  TipCalculator
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDBillAmount : NSObject

@property double originalBillAmount;


- (double)calculatePercentageTip:(double)tipPercentage;

- (double)calculateTotalBillAmountWitTip:(double)tipPercentage;

- (NSString *)formatCalculationOfTip:(double)tipPercentage;
- (NSString *)formatCalculationOfTotalBillWitTip:(double)tipPercentage;


@end
