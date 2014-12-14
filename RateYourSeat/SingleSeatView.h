//
//  SingeSeatView.h
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 14.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleSeatView : UIView

@property (nonatomic, assign) BOOL on;
@property (nonatomic, assign) int rating;

-(void)switchON;

@end
