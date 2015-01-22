//
//  GUNViewController.m
//  GUNAlert
//
//  Created by Michał Taszycki on 01/22/2015.
//  Copyright (c) 2014 Michał Taszycki. All rights reserved.
//

#import "GUNViewController.h"
#import <GUNAlert/GUNAlert.h>

@interface GUNViewController ()
@property (weak, nonatomic) IBOutlet UITextField *cancelButtonTextField;
@property (weak, nonatomic) IBOutlet UITextField *okButtonTextField;
@property (weak, nonatomic) IBOutlet UITextField *thirdButtonTextField;
@property (strong, nonatomic) GUNAlert *alert;
@end

@implementation GUNViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.alert = [[GUNAlert alloc] initWithViewController: self];
    self.cancelButtonTextField.text = @"No";
    self.okButtonTextField.text = @"Yes";
    self.thirdButtonTextField.text = @"Maybe";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showCancelAlertButtonTouchUpInside:(id)sender {
    [self.alert cancelAlertWithTitle:@"I'm a 'Cancel' Alert"
                               message:@"I show up with one button"
                           cancelTitle:self.cancelButtonTextField.text
                         cancelHandler:^{
                             NSLog(@"Cancel Handler Called");
                         }];
}
- (IBAction)showCancelOkAlertButtonTouchUpInside:(id)sender {

    [self.alert cancelOkAlertWithTitle:@"I'm a 'Cancel' & 'Ok' Alert"
                               message:@"I show up with two buttons"
                           cancelTitle:self.cancelButtonTextField.text
                         cancelHandler:^{
                             NSLog(@"Cancel Handler Called");
                         }
                               okTitle:self.okButtonTextField.text
                             okHandler:^{
                                 NSLog(@"Ok Handler Called");
                             }];
}
- (IBAction)showGenericAlertButtonTouchUpInside:(id)sender {
    [self.alert alertWithTitle:@"I'm a generic Alert"
                       message:@"I show up with as many buttons as you want."
                        titles:@[self.cancelButtonTextField.text,
                                 self.okButtonTextField.text,
                                 self.thirdButtonTextField.text]
                      handlers:@[^{
        NSLog(@"Cancel Handler Called");
    },^{
        NSLog(@"Ok Handler Called");
    },^{
        NSLog(@"Third Handler Called");
    }]];
}

@end
