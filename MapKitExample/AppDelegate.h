//
//  AppDelegate.h
//  MapKitExample
//
//  Created by Alan Pew on 6/29/13.
//  Copyright (c) 2013 Alan Pew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MapViewController *mapController;
@property (strong, nonatomic) UINavigationController *navController;
@end
