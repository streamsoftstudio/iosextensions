//
//  localization.swift
//  IOSExtensions
//
//  String-based localization helpers plus @IBInspectable keys for localizing
//  storyboard elements. Strings are resolved against the per-language `.lproj`
//  bundle inside the host app's main bundle, so the translations live in the
//  app while this helper lives in the shared package.
//

import Foundation
import UIKit

public protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {

    /// The active language code, normalising the various Chinese identifiers to
    /// `zh-Hans` / `zh-Hant`.
    public static var language: String {
        var l = String(Locale.current.identifier.split(separator: "_").first ?? "en")

        let simplified = ["zh", "zh-CHS", "zh_CHS", "zh-Hans", "zh_Hans", "zh-CN", "zh_CN", "zh-SG", "zh_SG"]
        if simplified.contains(l) { l = "zh-Hans" }

        let traditional = ["zh-CHT", "zh_CHT", "zh-Hant", "zh_Hant", "zh-HK", "zh_HK", "zh-MO", "zh_MO", "zh-TW", "zh_TW"]
        if traditional.contains(l) { l = "zh-Hant" }

        return l
    }

    public var localized: String {
        var path = Bundle.main.path(forResource: String.language, ofType: "lproj")
        if path == nil {
            path = Bundle.main.path(forResource: "en", ofType: "lproj")
        }
        guard let p = path, let bundle = Bundle(path: p) else {
            return self
        }
        var ret = NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        if ret == self {
            ret = NSLocalizedString(self, tableName: "app", comment: "")
        }
        return ret
    }

    public func localizedNumber(val: Int) -> String {
        String.localizedStringWithFormat(self.localized, val)
    }

    public func localizedNumber(val: Float) -> String {
        String.localizedStringWithFormat(self.localized, val)
    }

    public func localizedString(val: String) -> String {
        String.localizedStringWithFormat(self.localized, val)
    }

    public func localizedStrings(val1: String, val2: String) -> String {
        String.localizedStringWithFormat(self.localized, val1, val2)
    }

    public var english: String {
        guard let path = Bundle.main.path(forResource: "en", ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return self
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }

    public func englishWithNumber(val: Int) -> String {
        String.localizedStringWithFormat(self.english, val)
    }
}

public protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension UITabBarItem: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { nil }
        set { title = newValue?.localized }
    }
}

extension UILabel: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { nil }
        set { text = newValue?.localized }
    }
}

extension UIButton: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { nil }
        set {
            guard let localized = newValue?.localized else {
                setTitle(nil, for: .normal)
                return
            }
            if let attributedTitle = attributedTitle(for: .normal), attributedTitle.length > 0 {
                let attributes = attributedTitle.attributes(at: 0, effectiveRange: nil)
                setAttributedTitle(NSAttributedString(string: localized, attributes: attributes), for: .normal)
            } else {
                setTitle(localized, for: .normal)
            }
        }
    }
}

extension UITextField: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { nil }
        set { placeholder = newValue?.localized }
    }
}

extension UIBarButtonItem: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { nil }
        set { title = newValue?.localized }
    }
}
