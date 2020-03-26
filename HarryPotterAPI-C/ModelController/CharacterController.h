//
//  CharacterController.h
//  HarryPotterAPI-C
//
//  Created by Hin Wong on 3/26/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Character;

NS_ASSUME_NONNULL_BEGIN

@interface CharacterController : NSObject

+ (void) fetchCharacters: (void(^)(NSArray<Character *> *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
