//
//  Character.m
//  HarryPotterAPI-C
//
//  Created by Hin Wong on 3/26/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

#import "Character.h"

@implementation Character

- (instancetype)initWithName:(NSString *)name house:(NSString *)house alias:(NSString *)alias patronus:(NSString *)patronus boggart:(NSString *)boggart
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _house = house;
        _alias = alias;
        _patronus = patronus;
        _boggart = boggart;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    //coding keys
    NSString *name = dictionary[@"name"];
    NSString *house = dictionary[@"house"];
    NSString *alias = dictionary[@"alias"];
    NSString *patronus = dictionary[@"patronus"];
    NSString *boggart = dictionary[@"boggart"];
    
    return [self initWithName:name house:house alias:alias patronus:patronus boggart:boggart];
}

@end
