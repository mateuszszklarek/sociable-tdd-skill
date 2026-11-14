import UIKit

class DetailsView: UIView {
    private let headerTitleLabel = UILabel()
    let titleLabel = UILabel()

    init() {
        super.init(frame: .zero)
        headerTitleLabel.text = "Photo title:"
        backgroundColor = .systemBackground
        headerTitleLabel.textColor = .label
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.text = "N/A"

        addSubview(headerTitleLabel)
        addSubview(titleLabel)
        headerTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        titleLabel.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: headerTitleLabel.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: headerTitleLabel.trailingAnchor).isActive = true
    }

    required init?(coder: NSCoder) { nil }
}
