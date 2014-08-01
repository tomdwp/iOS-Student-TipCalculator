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

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *originalBilledAmountLabel;


@property (weak, nonatomic) IBOutlet UILabel *totalBillForTwentyPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalBillFifteenPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalBillTenPercentTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalBillUserPercentTipLabel;

@property (weak, nonatomic) IBOutlet UIStepper *userTipStepper;
@property (weak, nonatomic) IBOutlet UILabel *userTipAmountDisplayLabel;

@property (strong, nonatomic) TMDBillAmount *billAmount;

- (IBAction)changeUserTipPercentage:(id)sender;

- (void)updateUI;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.billAmount = [[TMDBillAmount alloc] init];
    
    self.billAmountTextField.delegate = self;
    
    
    [self clearUI];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeUserTipPercentage:(id)sender {
}


- (void)updateUI
{
    NSLog(@"self.billAmountTextField.text:  %@   \n self.billAmountTextField.text.doubleValue:  %f", self.billAmountTextField.text, self.billAmountTextField.text.doubleValue);
    
    if ( self.billAmountTextField.text.doubleValue != 0.0) {
        self.billAmount.originalBillAmount = self.billAmountTextField.text.doubleValue;
        
        //self.originalBillAmountLabel.text = self.billAmount.description;
        for (UILabel *originalBillAmtLabel in self.originalBilledAmountLabel) {
            originalBillAmtLabel.text = self.billAmount.description;
        }
        
        self.twentyPercentTipAmountLabel.text = [self.billAmount formatCalculationOfTip:0.20];
        self.fifteenPercentTipAmountLabel.text = [self.billAmount formatCalculationOfTip:0.15];
        self.tenPercentTipAmountLabel.text = [self.billAmount formatCalculationOfTip:0.10];
        
        self.totalBillForTwentyPercentTipLabel.text = [self.billAmount formatCalculationOfTotalBillWitTip:0.20];
        self.totalBillFifteenPercentTipLabel.text = [self.billAmount formatCalculationOfTotalBillWitTip:0.15];
        self.totalBillTenPercentTipLabel.text = [self.billAmount formatCalculationOfTotalBillWitTip:0.10];
        
    }
}

- (void)clearUI
{
    
    for (UILabel *originalBillAmtLabel in self.originalBilledAmountLabel) {
        originalBillAmtLabel.text = @"";
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn...");
    [self updateUI];
    
    [self.billAmountTextField resignFirstResponder];
    return YES;
}


@end
