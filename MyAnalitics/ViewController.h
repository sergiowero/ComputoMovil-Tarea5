//
//  ViewController.h
//  MyAnalitics
//
//  Created by MacL on 25/10/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleSignIn;
@import Firebase;


@interface ViewController : UIViewController<GIDSignInDelegate, GIDSignInUIDelegate>
- (IBAction)btnSignInPressed:(id)sender;
- (IBAction)btnSignOutPressed:(id)sender;


@end

