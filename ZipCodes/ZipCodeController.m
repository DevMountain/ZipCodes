//
//  ZipCodeController.m
//  ZipCodes
//
//  Created by Caleb Hicks on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ZipCodeController.h"

@implementation ZipCodeController

+ (ZipCodeController *)sharedInstance {
    static ZipCodeController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ZipCodeController new];
        [sharedInstance loadZips];
    });
    return sharedInstance;
}

- (void)loadZips {
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSError *error;
    
    NSArray *zips = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[bundle URLForResource:@"zips" withExtension:@"json"]] options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"Could not parse json because: %@", error.debugDescription);
    }
    
    NSMutableArray *zipCodes = [NSMutableArray new];
    
    for (NSDictionary *dictionary in zips) {
        Zip *zip = [[Zip alloc] initWithDictionary:dictionary];
        [zipCodes addObject:zip];
    }
    
    if (zipCodes) {
        self.zipCodes = zipCodes;
    }
}

@end
