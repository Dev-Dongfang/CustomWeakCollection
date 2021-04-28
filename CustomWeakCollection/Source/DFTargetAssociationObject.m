//
//  DFTargetAssociationObject.m
//  CustomWeakCollection
//
//  Created by Dev-Dongfang on 2021/4/14.
//

#import "DFTargetAssociationObject.h"

@interface DFTargetAssociationObject()

@property (nonatomic, copy) id<NSCopying> aKey;
@property (nonatomic, weak) id<DFTargetAssociationObjectDelegate> delegate;

@end

@implementation DFTargetAssociationObject

+ (instancetype)objectWithKey:(id<NSCopying>)aKey deallocDelegate:(id<DFTargetAssociationObjectDelegate>)delegate {
    DFTargetAssociationObject *obj = [[DFTargetAssociationObject alloc] init];
    obj.aKey = aKey;
    obj.delegate = delegate;
    return obj;
}

- (void)dealloc {
    [_delegate targetAssociationObjectWillDeallocWithKey:_aKey];
}

@end
