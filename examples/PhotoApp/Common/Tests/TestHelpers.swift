import UIKit

extension UIView {

    func find<View: UIView, Property: Equatable>(for value: Property, by keyPath: KeyPath<View, Property>) -> View? {
        findAll(View.self).first { $0[keyPath: keyPath] == value }
    }

    func find<View: UIView>(_ viewType: View.Type, by matcher: (View) -> Bool) -> View? {
        findAll(View.self).first(where: matcher)
    }

    func contains<View: UIView>(_ viewType: View.Type, by matcher: (View) -> Bool) -> Bool {
        find(viewType, by: matcher) != nil
    }

    func findFirst<View: UIView>(_ viewType: View.Type) -> View? {
        findAll(View.self).first
    }

    func findAll<View: UIView>(_ viewType: View.Type) -> [View] {
        recursiveSubviews.compactMap { $0 as? View }
    }

    func findAll<View: UIView>(by matcher: (View) -> Bool) -> [View] {
        Array(recursiveSubviews.lazy.compactMap { $0 as? View }.filter(matcher))
    }

    // MARK: - Private

    private var recursiveSubviews: [UIView] {
        subviews + subviews.flatMap(\.recursiveSubviews)
    }

}
