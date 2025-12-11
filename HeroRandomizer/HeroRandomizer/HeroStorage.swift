import Foundation

final class HeroStorage {
    private enum Constants {
        static let lastHeroKey = "lastSelectedHero"
    }

    private let defaults: UserDefaults
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(defaults: UserDefaults = .standard, encoder: JSONEncoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder()) {
        self.defaults = defaults
        self.encoder = encoder
        self.decoder = decoder
    }

    func save(hero: Superhero) {
        guard let data = try? encoder.encode(hero) else { return }
        defaults.set(data, forKey: Constants.lastHeroKey)
    }

    func loadHero() -> Superhero? {
        guard let data = defaults.data(forKey: Constants.lastHeroKey) else { return nil }
        return try? decoder.decode(Superhero.self, from: data)
    }
}
