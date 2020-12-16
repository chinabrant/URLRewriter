//
//  URLRewriter.swift
//  URLRewriter
//
//  Created by brant on 16/12/2020.
//

import Foundation

/// URL重写
class URLRewriter {
    static let instance: URLRewriter = URLRewriter()
    private init() {
        
    }
    
    /// 规则
    private var _rules: [RewriteRule] = []
    var rules: [RewriteRule] {
        return _rules
    }
    
    /// FlagHandler
    private var _flagHandlers: [String: FlagHandler] = [:]
    
    /// 注册FlagHandler
    /// - Parameters:
    ///   - flag: flag
    ///   - handler: 对应的handler，要实现FlagHandler协议
    func register(flag: String, handler: FlagHandler) {
        if flag.count == 0 {
            return
        }
        
        _flagHandlers[flag] = handler
    }
    
    /// 更新规则
    /// - Parameter rules: 新的规则
    func updateRules(rules: [RewriteRule]) {
        _rules = rules
    }
    
    /// url和正则进行匹配
    /// - Parameters:
    ///   - url: 要匹配的url
    ///   - pattern: 正则表达式
    /// - Returns: 匹配结果
    func match(url: String, pattern: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let matches = regex.matches(in: url, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, url.count))
            
            var components: [String] = []
            for match in matches {
                for i in 0 ..< match.numberOfRanges {
                    let component = (url as NSString).substring(with: match.range(at: i))
                    components.append(component)
                }
            }
            
            return components
        } catch {
            
        }
        
        return []
    }
    
    /// 匹配成功后，组装改写后的url
    /// - Parameters:
    ///   - rule: 匹配到的规则
    ///   - parameters: 匹配结果参数
    ///   - url: 匹配的url
    /// - Returns: 改写后的url
    func targetUrl(rule: RewriteRule, parameters: [String], url: String) -> String {
        if let flag = rule.flag, flag.count > 0, let handler = _flagHandlers[flag] {
            return handler.handle(url: url, rule: rule, params: parameters)
        }
        
        var targetUrl = rule.target
        for i in 0 ..< parameters.count {
            targetUrl = targetUrl.replacingOccurrences(of: "$\(i)", with: parameters[i])
        }
        
        return targetUrl
    }
    
    /// 对指定url进行重写
    /// - Parameter url: 要重写的url
    /// - Returns: 重写后的url, 没有匹配到规则就返回原url
    func rewriteUrl(url: String) -> String {
        for rule in rules {
            let result = match(url: url, pattern: rule.pattern)
            if result.count > 0 {
                /// 匹配到了,后面的规则不再匹配，直接返回
                return targetUrl(rule: rule, parameters: result, url: url)
            }
        }
        
        /// 没有匹配到，返回原url
        return url
    }
}
