//
//  HHMovie.m
//  MovieSearch
//
//  Created by Hayden Hastings on 3/10/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import "HHMovie.h"

@implementation HHMovie

- (instancetype)initWitOriginalTitle:(NSString *)origianlTitle voteAverage:(NSString *)voteAverage overview:(NSString *)overview
{
    self = [super init];
    if (self) {
        _originalTitle = [origianlTitle copy];
        _voteAverage = [voteAverage copy];
        _overview = [overview copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *originalTitle = dictionary[@"original_title"];
    NSString *voteAverage = dictionary[@"vote_average"];
    NSString *overview = dictionary[@"overview"];
    
    return [self initWitOriginalTitle:originalTitle voteAverage:voteAverage overview:overview];
}

@end
