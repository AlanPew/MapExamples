//
//  MapViewController.h
//  MapKitExample
//
//  Created by Alan Pew on 7/1/13.
//  Copyright (c) 2013 Alan Pew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController

@property (nonatomic, retain) MKMapView *map;
@property (nonatomic, assign) BOOL isIphone5;
@end
