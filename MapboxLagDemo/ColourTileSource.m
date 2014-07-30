//
//  ColourTileSource.m
//  MapboxLagDemo
//
//  Created by Daniel Lichty on 2014-07-30.
//  Copyright (c) 2014 Daniel Lichty. All rights reserved.
//

#import "ColourTileSource.h"

#define kTileModulo 6

@interface ColourTileSource ()
{
  NSString *_colourScheme;
}

@end

@implementation ColourTileSource

- (id)initWithColourScheme:(NSString *)scheme
{
  if ((self = [super init]))
  {
    _colourScheme = scheme;
  }
  
  return self;
}

- (NSURL *)URLForTile:(RMTile)tile
{
  return [NSURL URLWithString:[NSString stringWithFormat:@"https://s3.amazonaws.com/public.dan.lichty.ca/colour_tiles/%@/%d_%d.png", _colourScheme, tile.x % kTileModulo, tile.y % kTileModulo]];
}

- (NSString *)shortName
{
  return _colourScheme;
}

- (NSString *)shortAttribution
{
  return @"@danlite";
}

- (NSString *)uniqueTilecacheKey
{
  return [NSString stringWithFormat:@"danlite_%@", _colourScheme];
}

@end
