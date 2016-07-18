//
//  NSArray+Safe.m
//  nullable
//
//  Created by vincent on 16/3/7.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import "NSArray+Safe.h"
#import <objc/runtime.h>

@implementation NSArray (Safe)

+ (void)load {
    
    Class arrayCls = NSClassFromString(@"__NSArrayI");
    
    Method originalMethod = class_getClassMethod(arrayCls, @selector(arrayWithObjects:count:));
    Method swizzledMethod = class_getClassMethod(arrayCls, @selector(na_arrayWithObjects:count:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
    Method originalMethod3 = class_getInstanceMethod(arrayCls, @selector(objectAtIndex:));
    Method swizzledMethod3 = class_getInstanceMethod(arrayCls, @selector(na_objectAtIndex:));
    method_exchangeImplementations(originalMethod3, swizzledMethod3);

}

- (id)na_objectAtIndex:(NSUInteger)index {
    
    if (self.count>index) {
        return [self na_objectAtIndex:index];
    }
    
    return nil;
    
}

+ (instancetype)na_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt {
    id nObjects[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i]) {
            nObjects[j] = objects[i];
            j++;
        }
    }
    
    return [self na_arrayWithObjects:nObjects count:j];
}
@end

@implementation NSMutableArray (Safe)

+ (void)load {
    Class arrayCls = NSClassFromString(@"__NSArrayM");
    
    Method originalMethod1 = class_getInstanceMethod(arrayCls, @selector(insertObject:atIndex:));
    Method swizzledMethod1 = class_getInstanceMethod(arrayCls, @selector(na_insertObject:atIndex:));
    method_exchangeImplementations(originalMethod1, swizzledMethod1);

    
    Method originalMethod3 = class_getInstanceMethod(arrayCls, @selector(objectAtIndex:));
    Method swizzledMethod3 = class_getInstanceMethod(arrayCls, @selector(na_objectAtIndex:));
    method_exchangeImplementations(originalMethod3, swizzledMethod3);
    
    Method originalMethod2 = class_getInstanceMethod(arrayCls, @selector(setObject:atIndex:));
    Method swizzledMethod2 = class_getInstanceMethod(arrayCls, @selector(na_setObject:atIndex:));
    method_exchangeImplementations(originalMethod2, swizzledMethod2);
}

- (id)na_objectAtIndex:(NSUInteger)index {
    
    if (self.count>index) {
        return [self na_objectAtIndex:index];
    }
    
    return nil;
    
}

- (void)na_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject)
        return;
    [self na_insertObject:anObject atIndex:index];
}

- (void)na_setObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject)
        return;
    [self na_setObject:anObject atIndex:index];
}

@end
