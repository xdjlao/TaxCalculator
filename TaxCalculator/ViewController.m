//
//  ViewController.m
//  TaxCalculator
//
//  Created by Jerry on 1/1/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property double caTax;
@property double chiTax;
@property double nyTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.priceTextField becomeFirstResponder];
    
    self.caTax = 7.5;
    self.chiTax = 9.25;
    self.nyTax = 4.5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onCalculateButtonTapped:(UIButton *)sender {
    NSString *state = [self.segmentedControl titleForSegmentAtIndex:self.segmentedControl.selectedSegmentIndex];
    if([state  isEqual: @"CA"]){
        [self calculateTax:self.caTax];
    } else if([state  isEqual: @"CHI"]){
        [self calculateTax:self.chiTax];
    } else {
        [self calculateTax:self.nyTax];
    }
}

- (IBAction)onSegmentedTapped:(UISegmentedControl *)sender {
    NSString *state = [self.segmentedControl titleForSegmentAtIndex:self.segmentedControl.selectedSegmentIndex];
    if([state  isEqual: @"CA"]){
        [self calculateTax:self.caTax];
    } else if([state  isEqual: @"CHI"]){
        [self calculateTax:self.chiTax];
    } else {
        [self calculateTax:self.nyTax];
    }
}

- (void)calculateTax:(double)taxPerc {
    if(![self.priceTextField.text  isEqual: @""]){
        double value = [self.priceTextField.text doubleValue];
        double tax = value * (taxPerc/100);
        self.resultLabel.text = [NSString stringWithFormat:@"$%.02f",tax];
    } else {
        self.resultLabel.text = [NSString stringWithFormat:@"$%.02f", 0.00];
    }
}

@end
