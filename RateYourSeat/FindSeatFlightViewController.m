//
//  FindSeatFlightViewController.m
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import "FindSeatFlightViewController.h"
#import "AFNetworking.h"
#import "SelectPreferencesViewController.h"

@interface FindSeatFlightViewController ()

@end

@implementation FindSeatFlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nextButton.layer.borderWidth=1.0f;
    _nextButton.layer.borderColor=[[UIColor whiteColor] CGColor];
    _flightnrTextfield.layer.borderWidth=1.0f;
    _flightnrTextfield.layer.borderColor=[[UIColor whiteColor] CGColor];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    NSLog(@"Fligthnr.: %@", self.flightNumber.text);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSLog(@"Flight Date: %@", [formatter stringFromDate:self.flightDate.date]);
    
    /* API Call
    NSDictionary *parameters = @{@"identifier": @"value", @"password": @"value"};
    NSString *endpointUrl = @"https://:TLEvjlxFrVCVJjHUtfcVfFuKLkABTQ51@tripquiz.azure-mobile.net/user/login/";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:endpointUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        // go to selected preferences View
        [self performSegueWithIdentifier:@"selectPreferences" sender:self];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);

    }];
     */
    
    // go to selected preferences View
//    SelectPreferencesViewController* preferenceView =
//    [[SelectPreferencesViewController alloc] initWithNibName:@"SelectPreferencesViewController" bundle:nil];
//    [self.view addSubview:preferenceView.view];
    
    SelectPreferencesViewController* preferenceView = [[SelectPreferencesViewController alloc] init];
    [self.navigationController pushViewController:preferenceView animated:YES];
    //[self presentViewController:preferenceView animated:YES completion:nil];
    // to get pack here, tutorial here https://www.youtube.com/watch?v=z6Oey-_yArI&src_vid=xSAaLyltE2s&feature=iv&annotation_id=annotation_2164320797
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if([segue.identifier isEqualToString:@"selectPreferences"])
    {
        NSLog(@"Segue called");
        if ([segue.destinationViewController isKindOfClass:[UIViewController class]])
        {
            //TasksTableViewController *controller = (TasksTableViewController *)segue.destinationViewController;
            // get selected location and pass to next view controller

            //controller.managedObjectContext = self.managedObjectContext;
        }
    }
    
}



@end
