import UIKit

final class ViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private let heroImageView = UIImageView()
    private let imageLoadingIndicator = UIActivityIndicatorView(style: .large)
    private let nameLabel = UILabel()
    private let aliasLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let attributesStackView = UIStackView()
    private let messageLabel = UILabel()
    private let randomizeButton = UIButton(type: .system)

    private var attributeLabels: [HeroDisplayModel.Attribute: UILabel] = [:]
    private var heroes: [Superhero] = []
    private var isLoadingHero = false
    private var currentImageTask: URLSessionDataTask?
    private var hasDisplayedHero = false

    private let service = SuperheroService.shared
    private let imageLoader = ImageLoader.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchRandomHero(shouldAnimate: false)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        currentImageTask?.cancel()
    }
}

private extension ViewController {
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureRandomizeButton()
        configureScrollView()
        configureHeroImageView()
        configureLabels()
        configureAttributesStack()
        configureMessageLabel()
    }

    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .vertical
        stackView.spacing = 16

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: randomizeButton.topAnchor, constant: -16),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    func configureHeroImageView() {
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.heightAnchor.constraint(equalToConstant: 280).isActive = true

        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.clipsToBounds = true
        heroImageView.layer.cornerRadius = 18
        heroImageView.backgroundColor = UIColor.secondarySystemBackground
        heroImageView.image = UIImage(systemName: "photo")

        imageLoadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        imageLoadingIndicator.hidesWhenStopped = true

        imageContainer.addSubview(heroImageView)
        imageContainer.addSubview(imageLoadingIndicator)

        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            heroImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),

            imageLoadingIndicator.centerXAnchor.constraint(equalTo: heroImageView.centerXAnchor),
            imageLoadingIndicator.centerYAnchor.constraint(equalTo: heroImageView.centerYAnchor)
        ])

        stackView.addArrangedSubview(imageContainer)
    }

    func configureLabels() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).withWeight(.bold)
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 2

        aliasLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        aliasLabel.textColor = .secondaryLabel
        aliasLabel.numberOfLines = 2

        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textColor = .tertiaryLabel
        subtitleLabel.numberOfLines = 0

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(aliasLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }

    func configureAttributesStack() {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor.separator
        divider.heightAnchor.constraint(equalToConstant: 1) .isActive = true
        stackView.addArrangedSubview(divider)

        let attributesTitleLabel = UILabel()
        attributesTitleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        attributesTitleLabel.text = "Powerstats & Bio"
        stackView.addArrangedSubview(attributesTitleLabel)

        attributesStackView.axis = .vertical
        attributesStackView.spacing = 10

        HeroDisplayModel.Attribute.allCases.forEach { attribute in
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textColor = .label
            label.numberOfLines = 0
            label.text = "\(attribute.title): —"
            attributesStackView.addArrangedSubview(label)
            attributeLabels[attribute] = label
        }

        stackView.addArrangedSubview(attributesStackView)
    }

    func configureMessageLabel() {
        messageLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        messageLabel.textColor = .secondaryLabel
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.text = "Tap Randomize to meet your first hero."
        stackView.addArrangedSubview(messageLabel)
    }

    func configureRandomizeButton() {
        var filled = UIButton.Configuration.filled()
        filled.title = "Randomize"
        filled.cornerStyle = .capsule
        filled.buttonSize = .large
        filled.imagePadding = 8
        filled.baseBackgroundColor = .systemIndigo
        filled.baseForegroundColor = .white

        randomizeButton.configuration = filled
        randomizeButton.translatesAutoresizingMaskIntoConstraints = false
        randomizeButton.addTarget(self, action: #selector(randomizeButtonTapped), for: .touchUpInside)

        view.addSubview(randomizeButton)

        NSLayoutConstraint.activate([
            randomizeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            randomizeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            randomizeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            randomizeButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

private extension ViewController {
    @objc
    func randomizeButtonTapped() {
        fetchRandomHero(shouldAnimate: true)
    }

    func fetchRandomHero(shouldAnimate: Bool) {
        guard !isLoadingHero else { return }
        isLoadingHero = true
        updateLoadingState(isLoading: true)

        if heroes.isEmpty {
            service.fetchAllHeroes { [weak self] result in
                self?.handleHeroListResult(result, shouldAnimate: shouldAnimate)
            }
        } else {
            presentRandomHero(shouldAnimate: shouldAnimate)
        }
    }

    func handleHeroListResult(_ result: Result<[Superhero], Error>, shouldAnimate: Bool) {
        switch result {
        case .success(let heroes):
            self.heroes = heroes
            presentRandomHero(shouldAnimate: shouldAnimate)
        case .failure(let error):
            presentError(error)
            finishLoading()
        }
    }

    func presentRandomHero(shouldAnimate: Bool) {
        guard let hero = heroes.randomElement() else {
            presentError(SuperheroService.ServiceError.emptyPayload)
            finishLoading()
            return
        }

        configure(with: HeroDisplayModel(hero: hero), shouldAnimate: shouldAnimate)
        finishLoading()
    }

    func configure(with model: HeroDisplayModel, shouldAnimate: Bool) {
        nameLabel.text = model.heroName
        aliasLabel.text = model.primaryAlias
        subtitleLabel.text = model.subtitle
        messageLabel.text = nil
        hasDisplayedHero = true
        HeroDisplayModel.Attribute.allCases.forEach { attribute in
            attributeLabels[attribute]?.text = "\(attribute.title): \(model.value(for: attribute))"
        }

        setHeroImage(nil, animated: false)
        currentImageTask?.cancel()

        guard let imageURL = model.imageURL else {
            setHeroImage(UIImage(systemName: "person.crop.square"), animated: shouldAnimate)
            return
        }

        imageLoadingIndicator.startAnimating()
        currentImageTask = imageLoader.loadImage(from: imageURL) { [weak self] result in
            guard let self else { return }
            self.imageLoadingIndicator.stopAnimating()
            switch result {
            case .success(let image):
                self.setHeroImage(image, animated: shouldAnimate)
            case .failure:
                self.setHeroImage(UIImage(systemName: "person.crop.square"), animated: shouldAnimate)
            }
        }
    }

    func setHeroImage(_ image: UIImage?, animated: Bool) {
        guard animated else {
            heroImageView.image = image
            return
        }

        UIView.transition(
            with: heroImageView,
            duration: 0.35,
            options: [.transitionCrossDissolve, .allowUserInteraction],
            animations: { self.heroImageView.image = image },
            completion: nil
        )
    }

    func updateLoadingState(isLoading: Bool) {
        randomizeButton.configuration?.showsActivityIndicator = isLoading
        randomizeButton.isEnabled = !isLoading
        randomizeButton.alpha = isLoading ? 0.8 : 1
        if isLoading, !hasDisplayedHero {
            messageLabel.text = "Fetching a new hero..."
        }
    }

    func finishLoading() {
        isLoadingHero = false
        updateLoadingState(isLoading: false)
    }

    func presentError(_ error: Error) {
        messageLabel.text = "Something went wrong. Please try again."
        guard presentedViewController == nil else { return }

        let alert = UIAlertController(
            title: "Unable to load hero",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

private extension UIFont {
    func withWeight(_ weight: UIFont.Weight) -> UIFont {
        let traits: [UIFontDescriptor.TraitKey: Any] = [.weight: weight.rawValue]
        let descriptor = fontDescriptor.addingAttributes([.traits: traits])
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}

