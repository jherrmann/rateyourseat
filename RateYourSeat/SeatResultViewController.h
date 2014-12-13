//
//  SeatResultViewController.h
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeatResultViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *bookNowButton;

- (IBAction)bookNow:(id)sender;

@end
