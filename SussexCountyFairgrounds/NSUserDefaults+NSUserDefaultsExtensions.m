//
//  NSUserDefaults+NSUserDefaultsExtensions.m
//  StitchData
//
//  Created by Avik B on 07/09/14.
//  Copyright (c) 2014 Avik B. All rights reserved.
//

#import "NSUserDefaults+NSUserDefaultsExtensions.h"

@implementation NSUserDefaults (NSUserDefaultsExtensions)

- (void)saveCustomObject:(id<NSCoding>)object
                     key:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    [self setObject:encodedObject forKey:key];
    [self synchronize];
}

- (id<NSCoding>)loadCustomObjectWithKey:(NSString *)key {
    NSData *encodedObject = [self objectForKey:key];
    id<NSCoding> object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

- (BOOL)objectExistsWithKey:(NSString *)key {
    return [self.dictionaryRepresentation.allKeys containsObject:key];
}

@end
