//
//  SelectPreferencesViewController.m
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import "SelectPreferencesViewController.h"
#import "SeatResultViewController.h"

@interface SelectPreferencesViewController ()

@end

@implementation SelectPreferencesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 
    // add boarder to button
    _noButton.layer.borderWidth=1.0f;
    _noButton.layer.borderColor=[[UIColor whiteColor] CGColor];
    _yesButton.layer.borderWidth=1.0f;
    _yesButton.layer.borderColor=[[UIColor whiteColor] CGColor];
    self.navigationItem.title = @"Seat preference";
    
    // some test setup
    NSMutableDictionary *power= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Do you want a power socket?", @"choice": @YES, @"background": @"Find_your_seat_power_socket_bgr"}];
    
    NSMutableDictionary *anxiety= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Do you have flight anxiety?", @"choice": @YES, @"background": @"Find_your_seat_anxiety_bgr"}];

    NSMutableDictionary *bathroom= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Do you want to have a bathroom close by?", @"choice": @YES, @"background": @"Find_your_seat_bathroom_bgr"}];
    
    NSMutableDictionary *hurry= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Do you need to deboard quickly?", @"choice": @YES, @"background": @"Find_your_seat_hurry_bgr"}];
    
    NSMutableDictionary *infant= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Are you traveling with an infant?", @"choice": @YES, @"background": @"Find_your_seat_infant_bgr"}];
    
    NSMutableDictionary *kitchen= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Do you want to have the kitchen close by?", @"choice": @YES, @"background": @"Find_your_seat_kitchen_bgr"}];
    
    NSMutableDictionary *legspace= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Do you want extra legspace?", @"choice": @YES, @"background": @"Find_your_seat_legspace_bgr"}];
    
    NSMutableDictionary *sleep= [[NSMutableDictionary alloc] initWithDictionary:@{@"text": @"Do you want to sleep?", @"choice": @YES, @"background": @"Find_your_seat_sleep_bgr"}];
    
    
    self.preferences = [[NSMutableArray alloc] init];
    [self.preferences addObject:power];
    [self.preferences addObject:anxiety];
    [self.preferences addObject:bathroom];
    [self.preferences addObject:hurry];
    [self.preferences addObject:infant];
    [self.preferences addObject:kitchen];
    [self.preferences addObject:legspace];
    [self.preferences addObject:sleep];
    self.currentPreferenceNr = 0;
 

    self.preferenceText.text = [[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"text"];
    self.backgoundImage.image = [UIImage imageNamed:[[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"background"]];
    
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

- (IBAction)importantClicked:(id)sender {
    NSLog(@"Yes clicked");
    [(NSMutableDictionary *)[self.preferences objectAtIndex:self.currentPreferenceNr] setObject:@YES forKey:@"choice"];
    [self nextScreen:self.currentPreferenceNr];
}

- (IBAction)ignoreClicked:(id)sender {
    NSLog(@"No clicked");
   [(NSMutableDictionary *)[self.preferences objectAtIndex:self.currentPreferenceNr] setObject:@NO forKey:@"choice"];
    [self nextScreen:self.currentPreferenceNr];
}

-(void)nextScreen:(int) currentScreenNumer {
    if (currentScreenNumer+1 < [self.preferences count]) {
        self.currentPreferenceNr = currentScreenNumer+1;
        self.preferenceText.text = [[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"text"];
        [self.view setNeedsDisplay];
        self.backgoundImage.image = [UIImage imageNamed:[[self.preferences objectAtIndex:self.currentPreferenceNr] objectForKey:@"background"]];
    } else {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *resultView = [sb instantiateViewControllerWithIdentifier:@"seatResult"];

        //SeatResultViewController* preferenceView = [[SeatResultViewController alloc] init];
        [self.navigationController pushViewController:resultView animated:YES];
    }

}
@end
