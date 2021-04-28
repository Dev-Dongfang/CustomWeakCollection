//
//  DFTargetAssociationObject.h
//  CustomWeakCollection
//
//  Created by Dev-Dongfang on 2021/4/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@class DFTargetAssociationObject;
@protocol DFTargetAssociationObjectDelegate <NSObject>

- (void)targetAssociationObjectWillDeallocWithKey:(id<NSCopying>)aKey;

@end

@interface DFTargetAssociationObject : NSObject

+ (instancetype)objectWithKey:(id<NSCopying>)aKey deallocDelegate:(id<DFTargetAssociationObjectDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
