//
//  DFWeakDictionary.h
//  CustomWeakCollection
//
//  Created by Dev-Dongfang on 2021/4/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DFWeakDictionary : NSObject

/// 从字典中移除一个元素
/// @param aKey 被移除元素的key
- (void)removeObjectForKey:(id<NSCopying>)aKey;


/// 向字典中添加一个元素
/// @param anObject 元素的值
/// @param aKey 元素的key
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;


/// 从字典中获取一个元素
/// @param aKey 元素的key
- (nullable id)objectForKey:(id<NSCopying>)aKey;

@end

NS_ASSUME_NONNULL_END
