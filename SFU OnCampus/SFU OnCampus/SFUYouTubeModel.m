//
//  SFUYouTubeModel.m
//  OnCampus
//
//  Created by Sunny Chowdhury on 2015-03-21.
//  Copyright (c) 2015 Simon Fraser University. All rights reserved.
//

#import "SFUYouTubeModel.h"

@implementation SFUYouTubeModel


NSArray *array;
-(SFUYouTubeModel*) init {
    
    // This is an user defined path in interface builder
    // Take a look under the identity panel to see it
    @try {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"SFUYouTubeURLs" ofType:@"plist"];
        array = [NSArray arrayWithContentsOfFile:path];
    }
    @catch (NSException *e) {
        
    }
    [self sortOnKey:@"title"];
    
    return self;
}

-(void)initWithPlist:(NSString*) plist
{
    //This is a user defined path in interface builder
    //Take a look under the identity panel to see it.
    @try{
        NSString* path=[[NSBundle mainBundle]pathForResource:plist ofType:@"plist"];
        array = [NSArray arrayWithContentsOfFile:path];
    }
    @catch (NSException* e)
    {
        
    }
    
}

-(void)sortOnKey: (NSString*)sortKey
{
    [array sortedArrayUsingDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:sortKey ascending:YES],nil]];
}

-(NSString*) urlStringForIndex:(NSUInteger)idx
{
    NSDictionary* d = [array objectAtIndex:idx];
    return [d objectForKey:@"url"];
}

-(NSString*) titleStringForIndex:(NSUInteger)idx
{
    NSDictionary* d = [array objectAtIndex:idx];
    return [d objectForKey:@"title"];
}

-(NSInteger)sizeOfArray
{
    return [array count];
}

-(NSString*) imageNameForIndex: (NSUInteger) idx
{
    NSDictionary* d = [array objectAtIndex:idx];
    return [d objectForKey:@"image"];
}




@end
