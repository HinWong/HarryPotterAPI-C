//
//  Character.h
//  HarryPotterAPI-C
//
//  Created by Hin Wong on 3/26/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly, nullable) NSString *house;
@property (nonatomic, copy, readonly, nullable) NSString *alias;
@property (nonatomic, copy, readonly, nullable) NSString *patronus;
@property (nonatomic, copy, readonly, nullable) NSString *boggart;

- (instancetype) initWithName: (NSString *)name
                        house: (NSString *)house
                        alias: (NSString *)alias
                     patronus: (NSString *)patronus
                      boggart: (NSString *)boggart;

@end

@interface Character (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
