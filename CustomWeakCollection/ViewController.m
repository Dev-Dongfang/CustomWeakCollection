//
//  ViewController.m
//  CustomWeakCollection
//
//  Created by Dev-Dongfang on 2021/4/14.
//

#import "ViewController.h"
#import "DFWeakDictionary.h"

@interface ViewController ()

@property (nonatomic, strong) DFWeakDictionary *weakDictionary;

@property (nonatomic, strong) NSObject *obj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weakDictionary = [[DFWeakDictionary alloc] init];
    
    self.obj = [[NSObject alloc] init];
    [self.weakDictionary setObject:self.obj forKey:@"abcdefg"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    static NSInteger num = 1;
    
    if (num == 3) {
        self.obj = nil;
    }
    
    NSString *key = [NSString stringWithFormat:@"key_%ld", num];
    [self.weakDictionary setObject:[NSObject new] forKey:key];
    
    NSLog(@"%@", [self.weakDictionary debugDescription]);
    
    num += 1;
    
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    id obj = [NSObject new];
    [mapTable setObject:obj forKey:@"pbj"];
    NSLog(@"%@", mapTable);
    obj = nil;
    NSLog(@"%@", mapTable);
    
    NSMutableArray *array = [NSMutableArray array];
    id obj1 = [NSObject new];
    __weak id weakObj1 = obj1;
    [array addObject:weakObj1];
    NSLog(@"%@", array);
    obj = nil;
    NSLog(@"%@", array);
    
    
}


- (void)test {
    
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    
    NSHashTable *hashTable = [NSHashTable weakObjectsHashTable];
    
    
    NSPointerArray *pointerArray = [NSPointerArray weakObjectsPointerArray];
    
}


@end

