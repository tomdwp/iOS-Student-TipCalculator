//
//  TMDViewController.m
//  TipCalculator
//
//  Created by Tom Daggett on 2014-08-01.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDViewController.h"
#import "TMDBillAmount.h"

@interface TMDViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *twentyPercentTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *fifteenPercentTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tenPercentTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *userDeterminedTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *originalBillAmountLabel;


@property (weak, nonatomic) IBOutlet UILabel *totalBillForTwentyPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalBillFifteenPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalBillTenPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalBillUserPercentTipLabel;

@property (weak, nonatomic) IBOutlet UIStepper *userTipStepper;

@property (strong, nonatomic) TMDBillAmount *billAmount;

- (IBAction)changeUserTipPercentage:(id)sender;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.billAmount = [[TMDBillAmount alloc] init];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeUserTipPercentage:(id)sender {
}
@end
