//
//  RateSeatViewController.h
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 14.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RateSeatViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
- (IBAction)yesClicked:(id)sender;
- (IBAction)noClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *noButton;
@property (strong, nonatomic) IBOutlet UIButton *yesButton;

@property (strong, nonatomic) NSMutableArray *preferences;
@property (nonatomic) int currentPreferenceNr;

@end
