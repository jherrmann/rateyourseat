//
//  SelectPreferencesViewController.h
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectPreferencesViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *preferenceTextField;
- (IBAction)importantClicked:(id)sender;
- (IBAction)ignoreClicked:(id)sender;

@end
