//
//  ViewController.m
//  MapboxLagDemo
//
//  Created by Daniel Lichty on 2014-07-28.
//  Copyright (c) 2014 Daniel Lichty. All rights reserved.
//

#import "ViewController.h"

#import <Mapbox/Mapbox.h>

#import "ColourTileSource.h"

#define kTileSourceUpdateInterval 3.0

@interface ViewController ()
{
  NSArray *_mapIDs;
  NSArray *_colourTileSources;
  NSUInteger _currentMapIndex;
  NSTimer *_nextMapTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
  _mapIDs = @[
              @"danlite.j36hc29f",
              @"danlite.j36jcj9k",
              @"danlite.j36hf897"
              ];
  _colourTileSources = @[
                         [[ColourTileSource alloc] initWithColourScheme:@"sunset"],
                         [[ColourTileSource alloc] initWithColourScheme:@"ocean"],
                         [[ColourTileSource alloc] initWithColourScheme:@"foliage"]
                         ];
  _currentMapIndex = 0;
  
  [self autoMapSwitchToggled];
  [self updateCodeLabel];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  
  [self updateMapTileSource];
}

- (void)updateMapTileSource
{
//  [self.mapView setTileSource:[[RMMapboxSource alloc] initWithMapID:(_mapIDs[_currentMapIndex])]];
  
//  lag seems slightly more noticeable with custom tile source
  [self.mapView setTileSource:_colourTileSources[_currentMapIndex]];
}

- (void)updateCodeLabel
{
  NSString *codeString = @"tiledLayerView.layer.contents = nil";
  UIColor *codeColor = self.debugSwitch.on ? [UIColor blackColor] : [UIColor colorWithHue:120.0/360.0 saturation:1.0 brightness:0.5 alpha:1.0];
  
  if (!self.debugSwitch.on)
  {
    codeString = [@"// " stringByAppendingString:codeString];
  }
  
  self.codeLabel.text = codeString;
  self.codeLabel.textColor = codeColor;
}

- (void)updateNextMapButton
{
  self.nextMapButton.enabled = !self.autoMapSwitch.on;
  [self.nextMapButton setTitle:(self.autoMapSwitch.on ? @"Automatic Map Switching" : @"Next Map") forState:UIControlStateNormal];
}

- (void)debugToggled
{
  self.mapView.clearTileLayerContents = self.debugSwitch.on;
  [self updateCodeLabel];
}

- (void)nextMapTapped
{
  _currentMapIndex = ++_currentMapIndex % _mapIDs.count;
  
  [self updateMapTileSource];
}

- (void)autoMapSwitchToggled
{
  [self updateNextMapButton];
  
  if (self.autoMapSwitch.on)
    [self startMapTimer];
  else
    [self stopMapTimer];
}

- (void)startMapTimer
{
  [_nextMapTimer invalidate];
  _nextMapTimer = [NSTimer scheduledTimerWithTimeInterval:kTileSourceUpdateInterval target:self selector:@selector(nextMapTapped) userInfo:nil repeats:YES];
}

- (void)stopMapTimer
{
  [_nextMapTimer invalidate];
}

@end
