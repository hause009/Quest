//
//  ViewController.m
//  Quest
//
//  Created by Admin on 02.07.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property GMSMarker *markerMap;
@end

@implementation ViewController
@synthesize markerMap;

//obtain their position and draw the map
- (void)viewDidLoad {
    
    mapView_.settings.myLocationButton = YES;
    mapView_.myLocationEnabled = YES;
    CLLocation * myLocation = mapView_.myLocation;
    
    NSLog(@"%f-%f",myLocation.coordinate.latitude, myLocation.coordinate.longitude);
    
    //GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20  zoom:6];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:myLocation.coordinate.latitude longitude:myLocation.coordinate.longitude  zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.settings.compassButton = YES;
    self->mapView_.delegate = self;
    self.view = mapView_;
}

//redrawing marker
-(void) mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
    if (markerMap.map != nil) {
     markerMap.map = nil;
    }
    markerMap = [[GMSMarker alloc] init];
    markerMap.position = coordinate;
    markerMap.title = [NSString stringWithFormat:@"%f-%f",coordinate.latitude,coordinate.longitude];
    markerMap.snippet = [NSString stringWithFormat:@"%f-%f",coordinate.latitude,coordinate.longitude];
    markerMap.appearAnimation = kGMSMarkerAnimationPop;
    markerMap.map = mapView_;
}

//call Alert
-(void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {

     UIAlertView *windowTapped = [[UIAlertView alloc]
                                  initWithTitle:@"Вы выбрали такой-то адрес"
                                  message:@"Удалить маркер с карты?"
                                  delegate:nil
                                  cancelButtonTitle:@"Оставить"
                                  otherButtonTitles:@"Удалить",nil];
    [windowTapped show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
