//
//  ViewController.m
//  autoreeelease
//
//  Created by 李敏 on 2021/9/4.
//  Copyright © 2021 李敏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self testAutorelease];
    // Do any additional setup after loading the view.
}

- (void)testAutorelease{
    // ARC 无效下autorelease的使用
//    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];
//    id obj = [[NSObject alloc]init];
//    [obj autorelease];
//    [autoreleasePool drain];
}

- (void)testARCAutorelease {
    @autoreleasepool {
        id __autoreleasing obj = [[NSObject alloc] init];
    }
}

// 取得非自己生成并持有的对象的源码，如下
// 比如：NSArray array
// 即：编译器会检查方法名是否以alloc/new/copy/mutableCopy开始，如果不是则自动将返回值的对象注册到autoreleasepool
- (void)arrayAutorelease {
    @autoreleasepool {
        id __strong obj = [NSArray array];
    }
}

// 取得非自己生成并持有的对象时被调用方法的源码示例
+ (id)array{
    id obj = [[NSArray alloc] init];
    return obj; // return使得变量超出作用域，所有该强引用对应的自己持有的对象会被自动释放
    // 但该对象作为函数的返回值，编译器会自动将其注册到qutoreleasepool
}



@end
