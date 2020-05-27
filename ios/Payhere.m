//
//  Payhere.m
//  xcapp
//
//  Created by Harsha Kuruwita on 3/7/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(Payhere, NSObject)
RCT_EXTERN_METHOD(payOnece)
RCT_EXTERN_METHOD(callbackMethod:(RCTResponseSenderBlock)callback)
@end
