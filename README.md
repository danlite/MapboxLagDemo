## Preface

This is a demo app meant to demonstrate and test [Mapbox issue #472 - Setting tiledLayerView layer contents to nil blocks UI](https://github.com/mapbox/mapbox-ios-sdk/issues/472).

## Setup

Run `pod install`

## Usage

Use the "Automatic Map Switching" switch to toggle automatic cycling through the three tile sources. When disabled, a "Next Map" button appears to allow cycling manually through tile sources.

The second switch toggles between two behaviours for RMMapView:

1. __(default)__ clear tile view layer contents when setting/removing a tile source
2. __(proposed behaviour)__ do not clear tile view layer contents

While gradually panning/zooming around the map, take note of UI delays both with the second switch enabled, and with it disabled.

As the issue is seemingly related to tile loading, try testing on a slow network connection to see a more pronounced lagging effect using the default RMMapView behaviour.

![Screenshot](https://raw.githubusercontent.com/DanLite/MapboxLagDemo/master/screenshot.png)