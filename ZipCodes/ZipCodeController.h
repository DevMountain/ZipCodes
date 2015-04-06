//
//  ZipCodeController.h
//  ZipCodes
//
//  Created by Caleb Hicks on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Zip.h"

@interface ZipCodeController : NSObject

@property (strong, nonatomic) NSArray *zipCodes;

+ (ZipCodeController *)sharedInstance;

@end
