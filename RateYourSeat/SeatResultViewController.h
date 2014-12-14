//
//  SeatResultViewController.h
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeatResultViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *bookNowButton;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)bookNow:(id)sender;

@end
