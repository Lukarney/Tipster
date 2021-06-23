//
//  TipViewController.m
//  Tipster
//
//  Created by Luke Arney on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *LabelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}
- (IBAction)updateLabels:(id)sender {
    if (self.billAmountField.text.length == 0 ){
        [self hideLabels];
    }
    else {
        [self showLables];
    }
    double tipPercentages[] = {0.15,0.2, 0.25};
    double tipPercentage = tipPercentages [self.TipPercentageControl.selectedSegmentIndex ];
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%f",total];
}
- (void)hideLabels {
    [ UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y +=200;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.LabelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.LabelsContainerView.frame = labelsFrame;
        
        self.LabelsContainerView.alpha = 0;
    }];
    
}
- (void)showLables {
    [ UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y = 133;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.LabelsContainerView.frame;
        labelsFrame.origin.y = 241;
        
        self.LabelsContainerView.frame = labelsFrame;
        
        self.LabelsContainerView.alpha = 1;
    }];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
