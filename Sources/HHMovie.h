//
//  HHMovie.h
//  MovieSearch
//
//  Created by Hayden Hastings on 3/10/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHMovie : NSObject


- (instancetype)initWitOriginalTitle:(NSString *)origianlTitle voteAverage:(NSString *)voteAverage overview:(NSString *)overview;


@property (nonatomic, copy, readonly) NSString *originalTitle;
@property (nonatomic, copy, readonly) NSString *voteAverage;
@property (nonatomic, copy, readonly) NSString *overview;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
