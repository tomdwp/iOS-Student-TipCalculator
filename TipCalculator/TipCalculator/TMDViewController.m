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
    self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.billAmountTextField.keyboardAppearance = UIKeyboardAppearanceDark;
    
    self.userTipStepper.minimumValue = 5.0;
    self.userTipStepper.maximumValue = 35.0;
    self.userTipStepper.stepValue = 0.5;
    self.userTipStepper.value = 17.5;
    
    
    [self clearUI];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeUserTipPercentage:(id)sender
{
    if ( self.billAmountTextField.text.doubleValue != 0.0) {
        [self updateUI];
    } else {
        self.userTipAmountDisplayLabel.text = [NSString stringWithFormat:@"%.1f", self.userTipStepper.value];
    }
}


- (void)updateUI
{
    NSLog(@"self.billAmountTextField.text:  %@   \n self.billAmountTextField.text.doubleValue:  %f", self.billAmountTextField.text, self.billAmountTextField.text.doubleValue);
    
    if ( self.billAmountTextField.text.doubleValue != 0.0) {
        
        // set the model object with correct original bill amount
        self.billAmount.originalBillAmount = self.billAmountTextField.text.doubleValue;
        
        
        //
        //  start updating UI fields
        //
        
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
        
        
        self.userTipAmountDisplayLabel.text = [NSString stringWithFormat:@"%.1f", self.userTipStepper.value];
        
        self.totalBillUserPercentTipLabel.text = [self.billAmount formatCalculationOfTotalBillWitTip:self.userTipStepper.value];
        
        
    }
}

- (void)clearUI
{
    
    for (UILabel *originalBillAmtLabel in self.originalBilledAmountLabel) {
        originalBillAmtLabel.text = @"";
    }
    
    self.twentyPercentTipAmountLabel.text = @"";
    self.fifteenPercentTipAmountLabel.text = @"";
    self.tenPercentTipAmountLabel.text = @"";
    
    self.totalBillForTwentyPercentTipLabel.text = @"";
    self.totalBillFifteenPercentTipLabel.text = @"";
    self.totalBillTenPercentTipLabel.text = @"";
    
    self.userTipAmountDisplayLabel.text = [NSString stringWithFormat:@"%.1f", self.userTipStepper.value];
    self.userDeterminedTipAmountLabel.text = @"";
    self.totalBillUserPercentTipLabel.text = @"";

}

//
//  get textfield to resign first responder when user touches elsewhere
//
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([self.billAmountTextField isFirstResponder] && [touch view] != self.billAmountTextField) {
        
        [self.billAmountTextField resignFirstResponder];
        
        [self updateUI];
        
    }
    [super touchesBegan:touches withEvent:event];
    
    
}

#pragma mark - UITextField Protocol methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // don't think I need this method
}


//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if ( self.billAmountTextField.text.doubleValue != 0.0) {
//        
//        NSRange rangeOfDotCharacter = [self.billAmountTextField.text rangeOfString:@"."];
//        
//        if(rangeOfDotCharacter.location != NSNotFound) {
//            
//            NSArray *stringArray = [self.billAmountTextField.text componentsSeparatedByString:@"."];
//            
//            if ([stringArray count] == 2) {
//                
//                if (((NSString *)stringArray[1]).length == 2) {
//                    
//                    [self.billAmountTextField resignFirstResponder];
//                    [self updateUI];
//                }
//                
//            }
//        }
//    }
//    
//    return YES;
//}


- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self clearUI];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn...");
    
    [self updateUI];
    
    [self.billAmountTextField resignFirstResponder];
    
    return YES;
}


@end
