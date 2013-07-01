//
//  MapViewController.m
//  MapKitExample
//
//  Created by Alan Pew on 7/1/13.
//  Copyright (c) 2013 Alan Pew. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map,isIphone5;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeMap];
    [self.view addSubview:self.map];
	// Do any additional setup after loading the view.
}

-(void)makeMap{

    if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        CGFloat scale = [UIScreen mainScreen].scale;
        result = CGSizeMake(result.width * scale, result.height * scale);
        if(result.height == 1136){
            NSLog(@"iphone 5 test");
            self.isIphone5=true;
        } else {
            self.isIphone5=false;
            NSLog(@"not iphone 5 test");
        }
    }



    CGRect frame = [UIScreen mainScreen].bounds;
    float iphone5y;
    if (self.isIphone5){
        NSLog(@"is iphone 5");
        frame=CGRectMake(0, 0, 320, 568);
        iphone5y=88;
    }
    else{
        NSLog(@"isnt iphone 5");
        frame=CGRectMake(0, 0, 320, 568);
        iphone5y=0;
    }
    float statusbar =  [UIApplication sharedApplication].statusBarFrame.size.height;
    MKMapView *newmap = [[MKMapView alloc] initWithFrame:
                       CGRectMake(0,statusbar, self.view.frame.size.width,  self.view.frame.size.height+iphone5y-statusbar)];
    self.map=newmap;
    [newmap release];

    //MKMapRect flyTo = [map makeMapRectFromKML:kmlAnno];
    //map.mapView.visibleMapRect = flyTo;
    //[map.mapView addAnnotations:kmlAnno.annotations];
    //[self.view addSubview:self.map.mapView];
    //self.map.mapView.frame=CGRectMake(self.view.frame.size.width/2,self.view.frame.size.height/2,0,0);


    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:[self view] cache:YES];
    float height = self.view.frame.size.height+iphone5y;
    NSLog(@"phone height %.0f %.0f %.0f",height,self.view.frame.size.height,iphone5y);
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        self.map.frame= CGRectMake(0,40, self.view.frame.size.width,height-40 );
    }
    else{
        self.map.frame= CGRectMake(0,statusbar, self.view.frame.size.width,height );
    }
    //self.map.mapView.frame= CGRectMake(0, 0, 320, 568);
    [UIView commitAnimations];


    //[self.view addSubview:self.map.overlayButton];
    // [self.view addSubview:self.map.showAllAnno];
    // [self.view addSubview:self.map.removeAllAnno];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
