//
//  LogInViewController.m
//  RateCoffee
//
//  Created by Adam Smith on 15/08/2015.
//  Copyright (c) 2015 Adam Smith. All rights reserved.
//

#import "LogInViewController.h"

@implementation LogInViewController



- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    [self checkWhetherTheUserIsCurrentlyLoggedIn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) checkWhetherTheUserIsCurrentlyLoggedIn{
    
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        
        NSLog(@"the user is currently logged in");
        
        [self performSegueWithIdentifier:@"toCoffeeSegue" sender:self];
        
    } else {
        
        NSLog(@"the user is not logged in");
        
    }
    
}

- (IBAction)signUpUser:(id)sender{
    
    self.signUpButton.enabled = NO;
    
    PFUser *user = [PFUser user];
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextfield.text;
    user.email = self.userEmailTextField.text;
    
    if([self verifyUserHasFilledInAllDetails] == YES){
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                
                NSLog(@"user can use app");
                
                UIAlertView *successfulSignUpAlert = [[UIAlertView alloc] initWithTitle:@"Signed Up!"
                                                                              message:@"You have successfully signed up!"
                                                                             delegate:self cancelButtonTitle:@"OK"
                                                                    otherButtonTitles:nil];
                
                [successfulSignUpAlert show];
                
                self.signUpButton.enabled = YES;
                
            } else {   NSString *errorString = [error userInfo][@"error"];
                
                NSLog(@"%@", errorString);
                
                UIAlertView *problemSigningUpAlert = [[UIAlertView alloc] initWithTitle:@"Problem signing up!"
                                                                              message:@"These details may be taken already, please recheck them"
                                                                             delegate:self cancelButtonTitle:@"OK"
                                                                    otherButtonTitles:nil];
                [problemSigningUpAlert show];
                
                self.signUpButton.enabled = YES;
                
            }
        }];
        
    } else{
        
        self.signUpButton.enabled = YES;
    }
}

-(BOOL) verifyUserHasFilledInAllDetails{
    
    if(self.usernameTextField.text.length > 7 &&
       self.passwordTextfield.text.length > 7 &&
       self.userEmailTextField.text.length > 7){
        
        return YES;
        
    }else{
        
        UIAlertView *invalidDetailsAlert = [[UIAlertView alloc] initWithTitle:@"Invalid Details"
                                                                      message:@"User details have not been filled in correctly"
                                                                     delegate:self cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil];
        [invalidDetailsAlert show];
        
        return NO;
    }
    
    
    
}
- (IBAction)logInUser:(id)sender {
    
    self.logInButton.enabled = NO;
    
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextfield.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            
                                            NSLog(@"successful log in");
                                            
                                            self.logInButton.enabled = YES;
                                            
                                            [self performSegueWithIdentifier:@"toCoffeeSegue" sender:self];
                                            
                                        } else {
                                            
                                            NSLog(@"log in failed: %@", error.description);
                                            
                                            UIAlertView *logInUnsuccessfulAlert = [[UIAlertView alloc] initWithTitle:@"Log In Problem"
                                                                                                            message:@"The log in details entered are invalid"
                                                                                                           delegate:self cancelButtonTitle:@"OK"
                                                                                                  otherButtonTitles:nil];
                                        
                                            [logInUnsuccessfulAlert show];
                                            
                                            self.logInButton.enabled = YES;
                                        }
                                    }];
}

- (IBAction)emailTextFieldGotFocus:(id)sender {
    
    NSLog(@"here at email got focus");
  
    [UIView animateWithDuration:0.15
                     animations:^{
                         self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -120, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
}

- (IBAction)emailTextFieldLostFocus:(id)sender {
    
    NSLog(@"here at email got focus");
    
    [UIView animateWithDuration:0.15
                     animations:^{
                         self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y +120, self.view.frame.size.width, self.view.frame.size.height);
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
}


- (IBAction)backToTheLogIn:(UIStoryboardSegue *)segue {
    
    [PFUser logOut];
    
    NSLog(@"logging out user");
    
}

-(BOOL) checkIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (void) dismissKeyboard
{
    [self.usernameTextField resignFirstResponder];
    [self.userEmailTextField resignFirstResponder];
    [self.passwordTextfield resignFirstResponder];
}



@end
