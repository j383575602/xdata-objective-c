//
//  LinkedBuffer.m
//  xdata-core
//
//  Created by zhangxiuyin on 2020/1/12.
//  Copyright © 2020 zhangxiuyin. All rights reserved.
//

#import "LinkedBuffer.h"

@interface Buffer: NSObject
@property NSInteger position;
@property NSInteger size;
@property Byte *buf;
@property Buffer* next;
@property NSInteger index;
-(instancetype) initWithSize:(NSInteger) size;
-(void) writeByte:(Byte) b;
-(void) writeBytes:(Byte*) bytes start: (NSInteger) start count:(NSInteger) count;
-(NSInteger) space;
@end

@interface LinkedBuffer()
@property Buffer* head;
@property Buffer* tail;
@property Buffer* current;
@property NSInteger size;
@property NSInteger bufferCount;
@end



@implementation Buffer
-(instancetype) initWithSize:(NSInteger)size {
    self = [super init];
    self.position = 0;
    self.size = size;
    Byte* bs = (Byte*)malloc(size);
    self.buf = bs;
    return self;
}
-(void) writeByte:(Byte) byte {
    self.buf[self.position] = byte;
    self.position++;
}
-(void) writeBytes:(Byte*) bytes start: (NSInteger) start count:(NSInteger) count {
    for (NSInteger i=0; i<count; i++) {
        [self writeByte:bytes[start+i]];
    }
}
-(NSInteger) space {
    return self.size - self.position;
}
@end


@implementation LinkedBuffer
-(instancetype)initWithSize:(NSInteger)size {
    self = [super init];
    self.size = size;
    self.head = self.current = [[Buffer alloc] initWithSize:size];
    self.tail = self.current;
    self.bufferCount ++;
    return self;
}

-(void) writeByte:(Byte)byte {
    NSInteger space = [self.current space];
    if (space > 0) {
        [self.current writeByte:byte];
    } else if (self.current.next == nil) {
        [self increaseBuffer];
        [self.current writeByte:byte];
    } else {
        self.current = self.current.next;
        self.current.position = 0;
        [self.current writeByte:byte];
    }
}

-(void) writeBytes: (Byte *) bytes length:(NSInteger)count {
    NSInteger wrote = 0;
    NSInteger remain;
    while((remain = count - wrote) > 0) {
        NSInteger space = [self.current space];
        NSInteger count = MIN(space,remain);
        [self.current writeBytes:bytes start:wrote count:count];
        if (space < remain) {
            if (self.current.next == nil) {
                [self increaseBuffer];
            } else {
                self.current = self.current.next;
                self.current.position = 0;
            }
        }
        wrote += count;
    };
}

-(void) increaseBuffer {
    self.bufferCount ++;
    self.current.next = [[Buffer alloc] initWithSize:self.size];
    self.current.next.index = self.current.index+1;
    self.current = self.current.next;
    self.tail = self.current;
}

-(void) jump:(NSInteger)count {
    NSInteger currentLeft = [self.current space];
    if (count <= currentLeft) {
        self.current.position += count;
        return;
    }
    NSInteger bufferNeed = (count - currentLeft + self.size -1) / self.size;
    NSInteger left = (count - currentLeft) % self.size;
    self.current.position = self.size;
    for(int i=0;i<bufferNeed;i++) {
        if (self.current.next == nil) {
            [self increaseBuffer];
        } else {
            self.current.position= self.size;
            self.current = self.current.next;
        }
    }
    self.current.position = left;
}

-(void) seek:(NSInteger) position {
    NSInteger index = position / self.size;
    NSInteger left = position % self.size;
    Buffer *b = self.head;
    for(NSInteger i=0;i<index;i++) {
        b.position = self.size;
        b = b.next;
        if (b != nil) {
            self.current = b;
        }
    }
    if (b != nil) {
        b.position = left;
        self.current = b;
    }
}

-(Byte*) toBytes {
    NSInteger totalSize = [self getTotalSize];
    NSLog(@"totalsize:%ld",totalSize);
    Byte* result = malloc(totalSize);
    Buffer *h = self.head;
    NSInteger offset = 0;
    NSInteger srcPos = 0;
    NSInteger count = totalSize / self.size;
    NSInteger left = totalSize % self.size;
    Byte* p = result;
    for(NSInteger i=0;i<count;i++) {
        p = result + offset;
        memcpy(p, h.buf, h.position);
        free(h.buf);
        offset += h.position;
        h = h.next;
    }
    if (h != nil && left > 0) {
        //System.arraycopy(h.buffer,srcPos,bytes,start,left);
        p = result + offset;
        memcpy(p, h.buf, left);
        free(h.buf);
    }
    return result;
}

-(NSData*) toData {
    NSInteger length = [self getTotalSize];
    Byte* bytes = [self toBytes];
    NSData* data = [[NSData alloc] initWithBytes:bytes length:length];
    free(bytes);
    return data;
}

-(NSInteger) getPosition {
    return self.current.index * self.current.size + self.current.position;
}

-(NSInteger) getTotalSize {
    NSInteger totalSize = (self.bufferCount - 1) * self.size;
    totalSize += self.tail.position;
    return totalSize;
}
@end
