//
//  FindSeatFlightViewController.h
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindSeatFlightViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *flightNumber;
@property (strong, nonatomic) IBOutlet UIDatePicker *flightDate;
- (IBAction)next:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

@end
