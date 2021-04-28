//
//  DFWeakDictionary.m
//  CustomWeakCollection
//
//  Created by Dev-Dongfang on 2021/4/14.
//

#import "DFWeakDictionary.h"
#import "DFTargetAssociationObject.h"
#import <objc/runtime.h>

static const NSString *DFTargetAssociationKey;

@interface DFWeakDictionary() <DFTargetAssociationObjectDelegate>
@property (nonatomic, strong) NSMutableDictionary *container;
@end

@implementation DFWeakDictionary

- (instancetype)init {
    if (self = [super init]) {
        _container = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    return self;
}

- (void)removeObjectForKey:(id<NSCopying>)aKey {
    if (aKey) {
        [self.container removeObjectForKey:aKey];
    }
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!anObject) { return; }
    DFTargetAssociationObject *targetObject = [DFTargetAssociationObject objectWithKey:aKey deallocDelegate:self];
    objc_setAssociatedObject(anObject, &DFTargetAssociationKey, targetObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSValue *value = [NSValue valueWithNonretainedObject:anObject];
    [self.container setObject:value forKey:aKey];
    
}

- (nullable id)objectForKey:(id<NSCopying>)aKey {
    if (!aKey) { return nil; }
    NSValue *value = [self.container objectForKey:aKey];
    return value.nonretainedObjectValue;
}

- (void)targetAssociationObjectWillDeallocWithKey:(NSString *)aKey {
    [self removeObjectForKey:aKey];
}

- (NSString *)debugDescription {
    NSMutableString *desc = [NSMutableString stringWithString:@"\n--------------------------------"];
    for (NSString *key in self.container.allKeys) {
        id value = [self objectForKey:key];
        [desc appendFormat:@"\n%@: %@", key, value];
    }
    [desc appendFormat:@"\n--------------------------------"];
    return desc;
}

@end
