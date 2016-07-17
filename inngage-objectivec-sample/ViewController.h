//
//  ViewController.h
//  inngage-objectivec-sample
//
//  Created by Vinicius de Paula on 17/07/16.
//  Copyright © 2016 inngage.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <SystemConfiguration/SystemConfiguration.h>
@import PushNotificationManager;

@interface ViewController : UIViewController<CLLocationManagerDelegate> {
    
    CLLocationManager * locationManager;
    
}

@end