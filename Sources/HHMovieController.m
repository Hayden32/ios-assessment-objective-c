//
//  HHMovieController.m
//  MovieSearch
//
//  Created by Hayden Hastings on 3/10/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import "HHMovieController.h"
#import "HHMovie.h"
#import "MovieSearch-Swift.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3/search/movie?";

@implementation HHMovieController

+ (void)fetchMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^)(HHMovieController * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key=128dc47582d97fb8af23c29a91c465de" value:[self fetchAPIKey]];
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:@"query" value:[self fetchQueryKey]];
    
    [NetworkController performRequestFor:searchURL httpMethod:@"GET" urlParameters:nil body:nil completion:^(NSData * data, NSError * error) {
        if (error) {
            NSLog(@"Error: Could not get movie from search term. %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error: Data could not be returned from data task.");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Could not serialize into a NSDictionary", error);
            completion(nil);
            return;
        }
        
        HHMovie *movie = [[HHMovie alloc] initWithDictionary:jsonDictionary];
        completion(movie);
        
    }];
}

+ (HHMovieController *)shared {
    static HHMovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [HHMovieController new];
    });
    return sharedInstance;
}

@end
