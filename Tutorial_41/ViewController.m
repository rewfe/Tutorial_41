//
//  ViewController.m
//  Tutorial_41
//
//  Created by Admin on 11.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)schedulenotification:(id)sender {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    localNotification.alertBody =
    [NSString stringWithFormat:@"Fired at %@", [NSDate date]];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.category = @"ACTIONABLE";
    
    [[UIApplication sharedApplication]
     scheduleLocalNotification:localNotification];
}
@end
