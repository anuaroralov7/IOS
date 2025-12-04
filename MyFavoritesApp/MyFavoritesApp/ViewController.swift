import UIKit

final class FavoritesTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureTabs()
    }

    private func configureAppearance() {
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .secondaryLabel
        tabBar.backgroundColor = .systemBackground
    }

    private func configureTabs() {
        let controllers = FavoriteCategory.allCases.map { category -> UINavigationController in
            let list = FavoritesListViewController(category: category)
            list.title = category.title
            let navigation = UINavigationController(rootViewController: list)
            navigation.navigationBar.prefersLargeTitles = true
            navigation.tabBarItem = UITabBarItem(
                title: category.title,
                image: UIImage(systemName: category.tabIconName),
                selectedImage: UIImage(systemName: category.selectedTabIconName)
            )
            return navigation
        }

        viewControllers = controllers
    }
}

final class FavoritesListViewController: UIViewController {

    private let category: FavoriteCategory
    private let items: [FavoriteItem]
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    init(category: FavoriteCategory) {
        self.category = category
        self.items = category.items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .always
        configureTableView()
    }

    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 88, bottom: 0, right: 16)
        tableView.register(FavoriteItemCell.self, forCellReuseIdentifier: FavoriteItemCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 110

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FavoritesListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoriteItemCell.reuseIdentifier,
            for: indexPath
        ) as? FavoriteItemCell else {
            return UITableViewCell()
        }

        let item = items[indexPath.row]
        cell.configure(with: item, accentColor: category.accentColor)
        return cell
    }
}

extension FavoritesListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        let detail = FavoriteDetailViewController(item: item, accentColor: category.accentColor)
        navigationController?.pushViewController(detail, animated: true)
    }
}

final class FavoriteDetailViewController: UIViewController {

    private let item: FavoriteItem
    private let accentColor: UIColor

    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()

    private let heroImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let overviewLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let reviewHeaderLabel = UILabel()
    private let ratingLabel = UILabel()
    private let reviewLabel = UILabel()

    init(item: FavoriteItem, accentColor: UIColor) {
        self.item = item
        self.accentColor = accentColor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = item.title
        navigationItem.largeTitleDisplayMode = .never
        configureScrollView()
        configureContent()
    }

    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .vertical
        contentStack.spacing = 16
        contentStack.isLayoutMarginsRelativeArrangement = true
        contentStack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentStack.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
    }

    private func configureContent() {
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.contentMode = .scaleAspectFit
        heroImageView.backgroundColor = accentColor.withAlphaComponent(0.15)
        heroImageView.tintColor = accentColor
        heroImageView.layer.cornerRadius = 20
        heroImageView.clipsToBounds = true
        heroImageView.image = UIImage(systemName: item.systemImageName)
        heroImageView.heightAnchor.constraint(equalTo: heroImageView.widthAnchor, multiplier: 9.0 / 16.0).isActive = true

        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.text = item.title

        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = item.subtitle

        overviewLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        overviewLabel.text = "Overview"

        descriptionTextView.font = UIFont.systemFont(ofSize: 17)
        descriptionTextView.text = item.detailDescription
        descriptionTextView.isScrollEnabled = true
        descriptionTextView.isEditable = false
        descriptionTextView.textColor = .label
        descriptionTextView.backgroundColor = UIColor.secondarySystemBackground
        descriptionTextView.layer.cornerRadius = 12
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        descriptionTextView.heightAnchor.constraint(equalToConstant: 220).isActive = true

        reviewHeaderLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        reviewHeaderLabel.text = "Your Review"

        ratingLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .medium)
        ratingLabel.textColor = accentColor
        ratingLabel.text = item.ratingText

        reviewLabel.font = UIFont.systemFont(ofSize: 16)
        reviewLabel.numberOfLines = 0
        reviewLabel.text = item.review

        [heroImageView,
         titleLabel,
         subtitleLabel,
         overviewLabel,
         descriptionTextView,
         reviewHeaderLabel,
         ratingLabel,
         reviewLabel].forEach { contentStack.addArrangedSubview($0) }
    }
}
