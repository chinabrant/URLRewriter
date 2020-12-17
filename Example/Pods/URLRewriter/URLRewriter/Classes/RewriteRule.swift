//
//  RewriteRule.swift
//  URLRewriter
//
//  Created by brant on 16/12/2020.
//

import Foundation

/// 重写规则
struct RewriteRule {
    /// 匹配原始字符串的正则表达式
    let pattern: String
    
    /// 重写后的目标串， 参数用$0, $1这样的规则占位
    /// 这里得到的应该是一个本地支持的路由
    let target: String
    
    /// 额外的规则处理
    let flag: String?
    
    init(pattern: String, target: String, flag: String?) {
        self.pattern = pattern
        self.target = target
        self.flag = flag
    }
}
