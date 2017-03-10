//
//  HHMovieController.h
//  MovieSearch
//
//  Created by Hayden Hastings on 3/10/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HHMovie;

@interface HHMovieController : NSObject
NS_ASSUME_NONNULL_BEGIN

+ (void)fetchMovieWithSearchTerm:(NSString *)searchTerm completion:( void (^)(HHMovieController * _Nullable))completion;

+ (NSString *)fetchAPIKey;
+ (NSString *)fetchQueryKey;

+ (HHMovieController *)shared;

NS_ASSUME_NONNULL_END

@end
