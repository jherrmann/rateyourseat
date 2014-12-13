//
//  SelectPreferencesViewController.h
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectPreferencesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *preferenceText;
@property (strong, nonatomic) IBOutlet UIButton *noButton;
@property (strong, nonatomic) IBOutlet UIButton *yesButton;
@property (strong, nonatomic) IBOutlet UIImageView *backgoundImage;

- (IBAction)importantClicked:(id)sender;
- (IBAction)ignoreClicked:(id)sender;

@property (strong, nonatomic) NSMutableArray *preferences;
@property (nonatomic) int currentPreferenceNr;

@end
