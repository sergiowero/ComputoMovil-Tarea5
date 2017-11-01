//
//  AddCellViewController.m
//  Mi primera tabla
//
//  Created by MacL on 26/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import "BuyViewController.h"
@import Firebase;

@interface BuyViewController ()

@end

@implementation BuyViewController

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [FIRAnalytics logEventWithName:@"finish_buy" parameters:@{}];
}

@end
