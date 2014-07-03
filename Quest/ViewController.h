//
//  ViewController.h
//  Quest
//
//  Created by Admin on 02.07.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface ViewController : UIViewController <GMSMapViewDelegate>
{
    GMSMapView *mapView_;
}
@end
