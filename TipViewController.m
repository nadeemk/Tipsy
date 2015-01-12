//
//  TipViewController.m
//  Tipsy
//
//  Created by Nadeem Khan on 1/11/15.
//  Copyright (c) 2015 Nadeem Khan. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtBill;
@property (weak, nonatomic) IBOutlet UILabel *lblTip;
@property (weak, nonatomic) IBOutlet UILabel *lblTotal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmTipPercentage;
- (IBAction)onTap:(id)sender;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(self) {
        self.title = @"Tip Calculator";
        [self updateValues];
    }
}

- (IBAction)onValueChanged:(id)sender {
    [self updateValues];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void) updateValues {
    float billAmount = [self.txtBill.text floatValue];
    NSArray *tipValues = @[@(0.15), @(0.18), @(0.2)];
    float tipAmount  = billAmount * [tipValues[self.sgmTipPercentage.selectedSegmentIndex] floatValue];
    
    float totalAmount = billAmount + tipAmount;
    self.lblTip.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.lblTotal.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}
@end
