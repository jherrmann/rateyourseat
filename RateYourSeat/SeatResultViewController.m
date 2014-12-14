//
//  SeatResultViewController.m
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import "SeatResultViewController.h"
#import "SingleSeatView.h"

@interface SeatResultViewController ()

@end

@implementation SeatResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _bookNowButton.layer.borderWidth=1.0f;
    _bookNowButton.layer.borderColor=[[UIColor whiteColor] CGColor];
    
    // parse json dummy
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"seats" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"Entry %@", [json objectForKey:@"aircraftType"]);
    
    [[self scrollView] setContentSize:CGSizeMake(640, 200)];
    [self setUpPlaneView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bookNow:(id)sender {
    NSLog(@"Boock now deeplink here");
}

-(void)setUpPlaneView {
    CGFloat startX = CGRectGetMidX(self.scrollView.bounds)-100;
    CGFloat startY = CGRectGetMidY(self.scrollView.bounds)-54;
            CGFloat newY = startY;
    for (int row = 0; row < 7; row++) {


    
    for (int i = 0; i < 20; i++) {
        CGFloat newX = startX+25*i;

        //NSLog(@"startX %f", newX);
        //NSLog(@"startY %f", newY);
        
        SingleSeatView *seat = [[SingleSeatView alloc] init];
        //seat.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;

        seat.frame = CGRectMake(newX, newY, 18, 18);
        if (row==0 && i==7) {
            NSLog(@"code reached");
            [seat switchON];
        }
        if (row==3 && i==19) {
            [seat switchON];
        }
        [self.scrollView addSubview:seat];
    }
        if(row == 1 || row == 4 ) {
            newY = newY + 30;
        } else {
            newY = newY + 20;
        }
        
}


}

@end
