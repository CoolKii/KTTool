//
//  SandBoxPath.h
//  KTTool
//
//  Created by Kevin Tan on 2019/3/14.
//  Copyright © 2019 Ki. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SandBoxPath : NSObject


// 获取沙盒Document的文件目录
+ (NSString *)getDocumentDirectory;
// 获取沙盒Library的文件目录
+ (NSString *)getLibraryDirectory;
// 获取沙盒Library/Caches的文件目录
+ (NSString *)getCachesDirectory;
// 获取沙盒Preference的文件目录
+ (NSString *)getPreferencePanesDirectory;
// 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory;


// 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path;
// 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath;
// 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path;
// 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;

@end

NS_ASSUME_NONNULL_END
