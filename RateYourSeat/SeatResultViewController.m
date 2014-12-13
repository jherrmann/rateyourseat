//
//  SeatResultViewController.m
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 13.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import "SeatResultViewController.h"

@interface SeatResultViewController ()

@end

@implementation SeatResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _bookNowButton.layer.borderWidth=1.0f;
    _bookNowButton.layer.borderColor=[[UIColor whiteColor] CGColor];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    //if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"seatResultCell"];


    //}
    
    return cell;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 50;
    } else {
        return 0;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //action
}

@end
