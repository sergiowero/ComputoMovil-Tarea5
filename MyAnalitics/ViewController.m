//
//  ViewController.m
//  MyAnalitics
//
//  Created by MacL on 25/10/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Alerts.h"

@interface ViewController ()
@property(strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // TODO(developer) Configure the sign-in button look/feel
    // ...
    // Do any additional setup after loading the view, typically from a nib.
    
    //    [FIRAnalytics logEventWithName:kFIREventSelectContent
    //                        parameters:@{
    //                                     kFIRParameterItemID:[NSString stringWithFormat:@"Home"],
    //                                     kFIRParameterItemName:@"TitleHome"
    //                                     }];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnSignInPressed:(id)sender {
    [FIRAnalytics logEventWithName:@"Signin_button" parameters:@{
                                     @"name": @"Google",
                                     @"full_text": @"Gmail"
                                     }];
    [GIDSignIn sharedInstance].delegate = self;
    [GIDSignIn sharedInstance].uiDelegate = self;
    [[GIDSignIn sharedInstance] signIn];	
}

- (IBAction)btnSignOutPressed:(id)sender {
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }
}


- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // ...
    if (error == nil)
    {
        GIDAuthentication *authentication = user.authentication;
        FIRAuthCredential *credential = [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken accessToken:authentication.accessToken];
        // ...
        [[FIRAuth auth] signInWithCredential:credential completion:^(FIRUser *user, NSError *error)
        {
            if (error)
            {
                // ...
                return;
            }
            // User successfully signed in. Get user data from the FIRUser object
            // ...
            [self performSegueWithIdentifier:@"LoginToTable" sender:self];
        }];
    }
    else
    {
        // ...
    }
    
}

- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}
@end
