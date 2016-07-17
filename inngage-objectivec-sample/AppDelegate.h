//
//  AppDelegate.h
//  inngage-objectivec-sample
//
//  Created by Vinicius de Paula on 17/07/16.
//  Copyright © 2016 inngage.me. All rights reserved.
//

#import <UIKit/UIKit.h>
@import PushNotificationManager;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {

    PushNotificationManager * pushNotificationManager;
    
}

@property (strong, nonatomic) UIWindow *window;


@end

