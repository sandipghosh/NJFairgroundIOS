//
//  NSUserDefaults+NSUserDefaultsExtensions.h
//  StitchData
//
//  Created by Avik B on 07/09/14.
//  Copyright (c) 2014 Avik B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (NSUserDefaultsExtensions)

- (void)saveCustomObject:(id<NSCoding>)object
                     key:(NSString *)key;

- (id<NSCoding>)loadCustomObjectWithKey:(NSString *)key;

- (BOOL)objectExistsWithKey:(NSString *)key;

@end
