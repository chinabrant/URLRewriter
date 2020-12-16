//
//  FlagHandler.swift
//  URLRewriter
//
//  Created by brant on 16/12/2020.
//

import Foundation

/// 特殊的flag处理
protocol FlagHandler {
    
    /// url 匹配到规则后，如果规则里面的flag不为空，则调用对应的FlagHandler来处理
    /// - Parameters:
    ///   - url: url
    ///   - rule: 匹配到的规则
    ///   - params: 匹配到的参数 
    func handle(url: String, rule: RewriteRule, params: [String]) -> String
}
