//
//  ViewController.m
//  inngage-objectivec-sample
//
//  Created by Vinicius de Paula on 17/07/16.
//  Copyright © 2016 inngage.me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager =[[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; //whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
    {
        [locationManager requestWhenInUseAuthorization];
    }
    
    PushNotificationManager *pushNotificationManager  =
        [[PushNotificationManager alloc]init];
    
    if ( [CLLocationManager authorizationStatus]) {
        [pushNotificationManager handleUpdateLocations:locationManager];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *) getDeviceId {
    
    NSString *deviceID;
    UIDevice *device = [UIDevice currentDevice];
  if ([UIDevice instancesRespondToSelector:@selector(identifierForVendor)]) {
      deviceID = [[device identifierForVendor] UUIDString];
  } else {
        
    deviceID = [[NSUserDefaults standardUserDefaults] objectForKey:@"app identifier"];
    if (!deviceID) {
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
        deviceID = [NSString stringWithString:(NSString *) CFBridgingRelease(uuidStringRef)];
        CFRelease(uuidRef);
        [[NSUserDefaults standardUserDefaults] setObject:deviceID forKey:@"app identifier"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
  }
  return deviceID;
}


@end
