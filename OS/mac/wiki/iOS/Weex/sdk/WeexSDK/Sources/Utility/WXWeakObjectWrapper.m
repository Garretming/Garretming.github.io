/**
 * Created by Weex.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the Apache Licence 2.0.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import "WXWeakObjectWrapper.h"

@implementation WXWeakObjectWrapper

- (id)initWithWeakObject:(id)weakObject
{
    if (self = [super init]) {
        _weakObject = weakObject;
    }
    
    return self;
}

@end
