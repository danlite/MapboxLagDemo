//
//  ColourTileSource.h
//  MapboxLagDemo
//
//  Created by Daniel Lichty on 2014-07-30.
//  Copyright (c) 2014 Daniel Lichty. All rights reserved.
//

#import "RMAbstractWebMapSource.h"

@interface ColourTileSource : RMAbstractWebMapSource

- (id)initWithColourScheme:(NSString *)scheme;

@end
