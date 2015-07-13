//
//  AppDelegate.m
//  Tutorial_41
//
//  Created by Admin on 11.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"

static NSString *const NotificationCategoryIdent = @"ACTIONABLE";
static NSString *const NotificationActionOneIdent = @"First Action";
static NSString *const NotificationActionTwoIdent = @"Second Action";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self registerForNotificationsWithActions];
    return YES;
    
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"Received Local Notification:%@", notification);
    
    if ([UIApplication sharedApplication].applicationState ==
        UIApplicationStateActive) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Local Notification"
                                  message:@"App"
                                  delegate:nil
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(NSDictionary *)userInfo
  completionHandler:(void (^)())completionHandler {
    if ([identifier isEqualToString:NotificationActionOneIdent]) {
        NSLog(@"action 1.");
    } else if ([identifier isEqualToString:NotificationActionTwoIdent]) {
        NSLog(@"action 2.");
    }
    if (completionHandler) {
        completionHandler();
    }
}

- (void)registerForNotificationsWithActions {
    // Action 1
    UIMutableUserNotificationAction *action1;
    action1 = [[UIMutableUserNotificationAction alloc] init];
    [action1 setActivationMode:UIUserNotificationActivationModeBackground];
    [action1 setTitle:@"Open"];
    [action1 setIdentifier:NotificationActionOneIdent];
    [action1 setDestructive:NO];
    [action1 setAuthenticationRequired:NO];
    
    // Action 2
    UIMutableUserNotificationAction *action2;
    action2 = [[UIMutableUserNotificationAction alloc] init];
    [action2 setActivationMode:UIUserNotificationActivationModeBackground];
    [action2 setTitle:@"Close"];
    [action2 setIdentifier:NotificationActionTwoIdent];
    [action2 setDestructive:YES];
    [action2 setAuthenticationRequired:NO];
    
    // Create a category with actions
    UIMutableUserNotificationCategory *actionCategory;
    actionCategory = [[UIMutableUserNotificationCategory alloc] init];
    [actionCategory setIdentifier:NotificationCategoryIdent];
    [actionCategory setActions:@[ action1, action2 ]
                    forContext:UIUserNotificationActionContextDefault];
    NSSet *categories = [NSSet setWithObject:actionCategory];
    
    // Register the notification
    UIUserNotificationType types =
    (UIUserNotificationTypeAlert | UIUserNotificationTypeSound |
     UIUserNotificationTypeBadge);
    UIUserNotificationSettings *settings =
    [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
