//
//  Zip.m
//  ZipCodes
//
//  Created by Caleb Hicks on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Zip.h"

static NSString * const ZipZipKey = @"id";
static NSString * const ZipCityKey = @"city";
static NSString * const ZipCoordinatesKey = @"loc";
static NSString * const ZipPopulationKey = @"pop";
static NSString * const ZipStateKey = @"state";

@implementation Zip

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.zip = [dictionary[ZipZipKey] integerValue];
        self.city = dictionary[ZipCityKey];
        self.state = dictionary[ZipStateKey];
        self.population = [dictionary[ZipPopulationKey] integerValue];
        
        double latitude = [dictionary[ZipCoordinatesKey][0] doubleValue];
        double longitude = [dictionary[ZipCoordinatesKey][1] doubleValue];
        
        self.location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    }
    return self;
}

@end
