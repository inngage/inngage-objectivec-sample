//
//  AppDelegate.m
//  inngage-objectivec-sample
//
//  Created by Vinicius de Paula on 17/07/16.
//  Copyright © 2016 inngage.me. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([[UIApplication sharedApplication]
         respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:                                                                             (UIUserNotificationTypeSound |
             UIUserNotificationTypeAlert |
             UIUserNotificationTypeBadge) categories:nil]];
    }
    
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        
        [self application:application didReceiveRemoteNotification:launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]
        ];
    }
    
    pushNotificationManager  = [[PushNotificationManager alloc]init];
    
    NSDictionary* userInfo = [launchOptions valueForKey:@"UIApplicationLaunchOptionsRemoteNotificationKey"];
    
    NSDictionary *apsInfo = [userInfo objectForKey:@"aps"];
    
    if( [apsInfo objectForKey:@"alert"] != NULL) {
        
        [pushNotificationManager handlePushReceived:userInfo];
    }
    
    return YES;
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


- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
    [application registerForRemoteNotifications];
    
    [pushNotificationManager handlePushRegisterForRemoteNotifications:notificationSettings];
    
}

- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [pushNotificationManager handlePushRegistration:deviceToken];
    
}

- (void)application:(UIApplication *)application
    didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"Registration for remote notification failed with error: %@",
          error.localizedDescription);
    [pushNotificationManager handlePushRegistrationFailure:error];

}

- (void)application:(UIApplication *)application
    didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    [pushNotificationManager handlePushReceived:userInfo];
}


@end
