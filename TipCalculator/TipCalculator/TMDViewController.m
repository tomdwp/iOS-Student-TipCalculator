//
//  TMDViewController.m
//  TipCalculator
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDViewController.h"

@interface TMDViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *twentyPercentTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *fifteenPercentTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tenPercentTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *userDeterminedTipAmountLabel;


@end

@implementation TMDViewController

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

@end
