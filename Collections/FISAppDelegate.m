//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:YES];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
    
    return sortedArray;
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    
    NSSortDescriptor *sortByNilDec = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortByNilDec]];
    
    return sortedArray;
}


- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    
    NSString *firstObj = [array firstObject];
    NSString *lastObj = [array lastObject];
    NSLog(@"first object = %@, last object: %@", firstObj, lastObj);
    
    NSMutableArray *mut = [array mutableCopy];
    
    [mut replaceObjectAtIndex:0 withObject:lastObj];
    [mut removeLastObject];
    [mut addObject:firstObj];
    
    return mut;
}


- (NSArray *)arrayByReversingArray:(NSArray *)array {
        NSMutableArray *anArray = [[NSMutableArray alloc] initWithCapacity:[array count]];
        for (NSUInteger i = [array count]; (i) ; i--) {
            [anArray addObject:[array objectAtIndex:i - 1]];
            NSLog(@"Let's watch the array: %@", anArray);
        }
        return anArray;
}
   /*
    NSMutableArray *copy = [array mutableCopy];

    for(NSInteger i = 0; i < [array count]; i++) {
        NSString *first = [copy firstObject];
        [copy addObject:first];
        [copy removeObjectAtIndex:0];
         NSLog(@"Copy of the array: %@", copy);
    }
    NSLog(@"Copy of the array: %@", copy);
    return copy; */


- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    
    for (NSInteger charIdx=0; charIdx<string.length; charIdx++) {
        
        string = [string stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
        string = [string stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
        string = [string stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
        string = [string stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
        string = [string stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
        string = [string stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
        
        NSLog(@"look at new string: %@", string
              );
    }
    
    return string;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    
    //I think I should create two NSPredicates to sort and then feed both new arrays into a dictionay.
    NSPredicate *negNumPred = [NSPredicate predicateWithFormat:@"self < 0"];
    NSArray *negNumArray = [array filteredArrayUsingPredicate:negNumPred];

    NSLog(@"Negative Numbers Array: %@", negNumArray);
    
    NSPredicate *posNumPred = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSArray *posNumArray = [array filteredArrayUsingPredicate:posNumPred];
    
    NSLog(@"Postive Numbers Array: %@", posNumArray);
    
    NSArray *sortedArray = @[ negNumArray, posNumArray];
    
    return sortedArray;
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    
    NSArray *hobbits = [dictionary allKeysForObject:@"hobbit"];
    
    NSLog(@"check the array for hobbits: %@", hobbits);
    
    return hobbits;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    
    NSPredicate *aStringsPred = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *aStringsArray = [array filteredArrayUsingPredicate:aStringsPred];
    
    return aStringsArray;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    
    double sum = 0;
    for (NSNumber * n in array) {
        sum += [n doubleValue];
    }
    
    //This is probably for each string in the array (for loop), change the nsnumber to an nsinteger, then add them...somehow...
    return sum;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSMutableArray *copy = [array mutableCopy];
    
    for (NSUInteger i = 0; i < [copy count]; i++) {
        if ([copy[i] isEqualToString:@"foot"]) {
            [copy replaceObjectAtIndex:i withObject: @"feet"];
        }
        
        else if ([copy[i] isEqualToString:@"hand"]) {
            [copy replaceObjectAtIndex:i withObject: @"hands"];
        }
        
        else if ([copy[i] isEqualToString:@"knee"]) {
            [copy replaceObjectAtIndex:i withObject: @"knees"];
        }
        
        else if ([copy[i] isEqualToString:@"table"]) {
            [copy replaceObjectAtIndex:i withObject: @"tables"];
        }
        
        else if ([copy[i] isEqualToString:@"box"]) {
            [copy replaceObjectAtIndex:i withObject: @"boxes"];
        }
        
        else if ([copy[i] isEqualToString:@"ox"]) {
            [copy replaceObjectAtIndex:i withObject: @"oxen"];
        }
        
        else if ([copy[i] isEqualToString:@"axle"]) {
            [copy replaceObjectAtIndex:i withObject: @"axles"];
        }
        
        else if ([copy[i] isEqualToString:@"radius"]) {
            [copy replaceObjectAtIndex:i withObject: @"radii"];
        }
        
        else if ([copy[i] isEqualToString:@"trivium"]) {
            [copy replaceObjectAtIndex:i withObject: @"trivia"];
        }
    }
        return copy;
    }


    /*
    NSMutableArray *pluralArray = [[NSMutableArray alloc]init];
    
    NSPredicate *femPluralPred = [NSPredicate predicateWithFormat:@"self ENDSWITH 'ium'"];
    NSArray *femPlural = [array filteredArrayUsingPredicate:femPluralPred];
    [pluralArray addObjectsFromArray:femPlural];
    
    for (NSString *word in femPlural) {
     [word stringByReplacingOccurrencesOfString:@"ium" withString:@"ia"];
        NSLog(@"Check plural: %@", word);
    }
    
   */




/*
 singulars = @[ @"hand"   ,
 @"foot"   ,
 @"knee"   ,
 @"table"  ,
 @"box"    ,
 @"ox"     ,
 @"axle"   ,
 @"radius" ,
 @"trivium"];
 
 plurals = @[ @"hands" ,
 @"feet"  ,
 @"knees" ,
 @"tables",
 @"boxes" ,
 @"oxen"  ,
 @"axles" ,
 @"radii" ,
 @"trivia"];
 
 */

/*
 NSMutableArray *pluralArray = [[NSMutableArray alloc]init];
 for (NSString *string in array) {
 
 [string stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
 [string stringByReplacingOccurrencesOfString:@"ius" withString:@"ii"];
 [string stringByReplacingOccurrencesOfString:@"ium" withString:@"ia"];
 [string stringByReplacingOccurrencesOfString:@"*e" withString:@"es"];
 [string stringByReplacingOccurrencesOfString:@"?ox" withString:@"oxes"];
 [string stringByReplacingOccurrencesOfString:@"*ox" withString:@"oxen"];
 
 [pluralArray addObject:string];
 NSLog(@"What is the string? %@", string);
 NSLog(@"Let's look at the array: %@", pluralArray);
 */

- (NSDictionary *)countsOfWordsInString:(NSString *)string {    // Also need to build an array of punctuation. Will use that array to remove punctuation from string.
    
    NSMutableArray *wordKey = [[NSMutableArray alloc]init];
    NSMutableArray *wordCount = [[NSMutableArray alloc]init];
    NSDictionary *dictionary = @{};
    NSMutableDictionary *mDictionary = [dictionary mutableCopy];
    
    //Remove punctuation from string
    NSArray *punctuations = @[ @".", @",", @"!", @"?", @":", @";", @"-" ];
    NSString *withoutPunctuation = [string copy];
    
    for (NSUInteger i = 0; i < [punctuations count]; i++) {
        NSString *punctuation = punctuations[i];
        withoutPunctuation = [withoutPunctuation
                              stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    //NSLog(@"This is Moby Dick without punctuation: %@", withoutPunctuation);
    NSString *lowercase = [withoutPunctuation lowercaseString];
    //NSLog(@"This is Moby Dick lowercase without punctuation: '%@'", lowercase);
    NSArray *mobyDickArray = [lowercase componentsSeparatedByString:@" "];
    //NSLog(@"Array of first sentence of Moby Dick '%@'", mobyDickArray);
    
    NSCountedSet *set = [[NSCountedSet alloc] initWithArray:mobyDickArray];
    
    for (id item in set)
    {
        //NSLog(@"Word=%@, Count=%lu", item, (unsigned long)[set countForObject:item]);
        [wordKey addObject:item];
        NSNumber *numberOfLetter = @([set countForObject:item]);
        [wordCount addObject:numberOfLetter];
    }
    
    //NSLog(@"Word Key Array: %@", wordKey);
    //NSLog(@"Count of words array: %@", wordCount);
    
    for (NSUInteger i = 0; i < [wordKey count]; i++) {
        [mDictionary setObject:wordCount[i] forKey:wordKey[i]];
    }
    
    return mDictionary;
}




- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                   ascending:YES];
    NSArray *sortedArrayOfSongsAndArtists = [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
    NSLog(@"Sorted array of artists: %@", sortedArrayOfSongsAndArtists);
    
    NSMutableDictionary *pairDictionary = [[NSMutableDictionary alloc] init];
    //NSMutableArray *mut = [[NSMutableArray alloc]init];
    
    for (NSString *songArtistPair in sortedArrayOfSongsAndArtists) {
        NSArray *pairOfSongsAndArtists = [songArtistPair componentsSeparatedByString:@" - "];
        NSString *artist = pairOfSongsAndArtists[0];
        NSString *song = pairOfSongsAndArtists[1];
        
        if  ([[pairDictionary allKeys] containsObject:artist])
        {
            [pairDictionary[artist] addObject:song];
        }
        
        else {
            pairDictionary[artist] = [@[song]mutableCopy];
        }
        NSLog(@"check the dictionary %@", pairDictionary);
    }
    return pairDictionary;
}

/*
 
 First attempt:
 - (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
 
 NSMutableArray *mut = [[NSMutableArray alloc]init];
 NSMutableArray *artist = [[NSMutableArray alloc]init];
 NSMutableArray *songs = [[NSMutableArray alloc]init];
 NSDictionary *dictionary = @{};
 
 NSMutableDictionary *mDictionary = [dictionary mutableCopy];
 
 for (NSUInteger i = 0; i < [array count]; i++) {
 NSLog(@"Array without -: %@", array);
 [mut addObjectsFromArray:[array[i] componentsSeparatedByString:@"-"]];
 NSLog(@"Mutable Array without -: %@", mut);
 }
 
 NSLog(@"Mutable Array Outside of for loop without -: %@", mut);
 
 for (NSUInteger i = 0; i < [mut count]; i++) {
 if (i % 2) {
 [songs addObject:mut[i]];
 }
 else {
 [artist addObject:mut[i]];
 }
 NSLog(@"Artist Array: %@, Song Array: %@", artist, songs);
 
 }
 for (NSUInteger i = 0; i < [songs count]; i++) {
 [mDictionary setObject:artist[i] forKey:songs[i]];
 }
 
 
 NSLog(@"Look at the dictionary: %@", mDictionary);
 
 return dictionary;
 }
 
 */
@end
