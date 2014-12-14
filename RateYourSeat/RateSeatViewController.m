//
//  RateSeatViewController.m
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 14.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import "RateSeatViewController.h"

@interface RateSeatViewController ()

@end

@implementation RateSeatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add boarder to button
    _noButton.layer.borderWidth=1.0f;
    _noButton.layer.borderColor=[[UIColor whiteColor] CGColor];
    _yesButton.layer.borderWidth=1.0f;
    _yesButton.layer.borderColor=[[UIColor whiteColor] CGColor];
    self.navigationItem.title = @"Rate your seat";
    
    // some test setup
    NSMutableDictionary *power= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Was you power socket working?", @"choice": @YES, @"background": @"Find_your_seat_power_socket_bgr"}];
    
    NSMutableDictionary *hurry= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Have you been in a hurry?", @"choice": @YES, @"background": @"Find_your_seat_hurry_bgr"}];
    
    NSMutableDictionary *kitchen= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Was your meal OK?", @"choice": @YES, @"background": @"Find_your_seat_kitchen_bgr"}];
    
    NSMutableDictionary *legspace= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Did you have enough legspace?", @"choice": @YES, @"background": @"Find_your_seat_legspace_bgr"}];
    
    NSMutableDictionary *sleep= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Could you sleep?", @"choice": @YES, @"background": @"Find_your_seat_sleep_bgr"}];
    
    
    self.preferences = [[NSMutableArray alloc] init];
    [self.preferences addObject:power];
    [self.preferences addObject:hurry];
    [self.preferences addObject:kitchen];
    [self.preferences addObject:legspace];
    [self.preferences addObject:sleep];
    self.currentPreferenceNr = 0;
    
    
    self.questionLabel.text = [[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"text"];
    self.backgroundImage.image = [UIImage imageNamed:[[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"background"]];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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

- (IBAction)yesClicked:(id)sender {
    NSLog(@"Yes clicked");
    [(NSMutableDictionary *)[self.preferences objectAtIndex:self.currentPreferenceNr] setObject:@YES forKey:@"choice"];
    [self nextScreen:self.currentPreferenceNr];
}

- (IBAction)noClicked:(id)sender {
    NSLog(@"No clicked");
    [(NSMutableDictionary *)[self.preferences objectAtIndex:self.currentPreferenceNr] setObject:@NO forKey:@"choice"];
    [self nextScreen:self.currentPreferenceNr];
}


-(void)nextScreen:(int) currentScreenNumer {
    if (currentScreenNumer+1 < [self.preferences count]) {
        self.currentPreferenceNr = currentScreenNumer+1;
        self.questionLabel.text = [[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"text"];
        self.backgroundImage.image = [UIImage imageNamed:[[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"background"]];
        [self.view setNeedsDisplay];
    } else {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *resultView = [sb instantiateViewControllerWithIdentifier:@"thankyou"];

        [self.navigationController pushViewController:resultView animated:YES];
    }
    
}
@end
