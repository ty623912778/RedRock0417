//
//  NotesXMLParser.m
//  0409
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NotesXMLParser.h"

@implementation NotesXMLParser

- (void)start{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Notes" ofType:@"xml"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    parser.delegate = self;
    
    [parser parse];
    
    NSLog(@"解析完成");
}

- (void) parserDidStartDocument:(NSXMLParser *)parser
{
    _notes = [NSMutableArray new];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"%@",parseError);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    _currentTagName = elementName;
    if ([_currentTagName isEqualToString:@"Note"]) {
        NSString *_id = [attributeDict objectForKey:@"id"];
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:_id forKey:@"id"];
        [_notes addObject:dict];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([string isEqualToString:@""]) {
        return;
    }
    NSMutableDictionary *dict = [_notes lastObject];
    NSLog(@"_notes:%@ \n----lastDict:%@ \n----_currentTagName:%@",_notes,dict,_currentTagName);
    if ([_currentTagName isEqualToString:@"CDate"]&& dict) {
        [dict setObject:string forKey:@"CDate"];
        NSLog(@"_notes:%@",_notes);
    }
    if ([_currentTagName isEqualToString:@"Content"]&& dict) {
        [dict setObject:string forKey:@"Content"];
        
    }
    if ([_currentTagName isEqualToString:@"UserID"]&& dict) {
        [dict setObject:string forKey:@"UserID"];
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    self.currentTagName = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadViewNotification" object:self.notes userInfo:nil];
    self.notes = nil;
}

@end
