//
//  ViewController.h
//  MapboxLagDemo
//
//  Created by Daniel Lichty on 2014-07-28.
//  Copyright (c) 2014 Daniel Lichty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RMMapView;

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet RMMapView *mapView;
@property (nonatomic, strong) IBOutlet UISwitch *debugSwitch, *autoMapSwitch;
@property (nonatomic, strong) IBOutlet UIButton *nextMapButton;
@property (nonatomic, strong) IBOutlet UILabel *codeLabel;

- (IBAction)nextMapTapped;
- (IBAction)debugToggled;
- (IBAction)autoMapSwitchToggled;

@end
