//
//  CharacterController.m
//  HarryPotterAPI-C
//
//  Created by Hin Wong on 3/26/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

#import "CharacterController.h"
#import "Character.h"

static NSString * const baseURLString = @"https://www.potterapi.com/v1/";
static NSString * const character = @"characters";
static NSString * const apiKey = @"$2a$10$DmTT4MR6v/YsVtyzOf.9T.ZT/MlSIbA2YN8OOoFwL0YX88yXMPgey";

@implementation CharacterController

+ (void) fetchCharacters:(void(^)(NSArray<Character *> *_Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *characterURL = [baseURL URLByAppendingPathComponent:character];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *apiKeyQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    
    [queryItems addObject:apiKeyQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:characterURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSArray *arrayOfCharacterDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSMutableArray *characters = [NSMutableArray new];
            for (NSDictionary *characterDict in arrayOfCharacterDictionaries)
            {
                Character *character = [[Character alloc] initWithDictionary:characterDict];
                [characters addObject:character];
            }
            completion(characters);
        }
    }] resume];
    
}


@end
