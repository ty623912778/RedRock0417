//
//  NotesXMLParser.h
//  0409
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotesXMLParser : NSObject<NSXMLParserDelegate>

@property (strong,nonatomic) NSMutableArray *notes;

@property( strong,nonatomic) NSString *currentTagName;

- (void)start;

@end
