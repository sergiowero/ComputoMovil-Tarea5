//
//  InfoViewController.m
//  Mi primera tabla
//
//  Created by MacL on 27/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import "InfoViewController.h"
@import Firebase;

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property NSString *nameValue;
@property UIImage *imageValue;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nameLabel setText:self.nameValue];
    [self.image setImage:self.imageValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setInfoWithName:(NSString*)name andImage:(UIImage*) image {
    
    self.nameValue = name;
    self.imageValue = image;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [FIRAnalytics logEventWithName:@"Buy_shoe" parameters:@{
                                                            @"name": self.nameValue
                                                          }];
}


@end
