//
//  Zip.h
//  ZipCodes
//
//  Created by Caleb Hicks on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Zip : NSObject

@property (assign, nonatomic) NSInteger zip;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) CLLocation *location;
@property (assign, nonatomic) NSInteger population;
@property (strong, nonatomic) NSString *state;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
