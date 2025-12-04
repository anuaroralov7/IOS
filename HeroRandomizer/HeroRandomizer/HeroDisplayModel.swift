import Foundation

struct HeroDisplayModel {
    enum Attribute: CaseIterable {
        case publisher
        case alignment
        case firstAppearance
        case placeOfBirth
        case occupation
        case base
        case gender
        case race
        case height
        case weight
        case intelligence
        case strength
        case speed
        case durability
        case power
        case combat

        var title: String {
            switch self {
            case .publisher: return "Publisher"
            case .alignment: return "Alignment"
            case .firstAppearance: return "First Appearance"
            case .placeOfBirth: return "Place of Birth"
            case .occupation: return "Occupation"
            case .base: return "Base"
            case .gender: return "Gender"
            case .race: return "Race"
            case .height: return "Height"
            case .weight: return "Weight"
            case .intelligence: return "Intelligence"
            case .strength: return "Strength"
            case .speed: return "Speed"
            case .durability: return "Durability"
            case .power: return "Power"
            case .combat: return "Combat"
            }
        }
    }

    let heroName: String
    let primaryAlias: String
    let subtitle: String
    private let attributeValues: [Attribute: String]
    let imageURL: URL?

    init(hero: Superhero) {
        heroName = hero.name
        primaryAlias = HeroDisplayModel.resolvePrimaryAlias(from: hero)
        subtitle = hero.biography.alterEgos?.isEmpty == false ? hero.biography.alterEgos! : "Superhero Profile"
        imageURL = hero.primaryImageURL

        var values: [Attribute: String] = [:]
        values[.publisher] = HeroDisplayModel.format(hero.biography.publisher)
        values[.alignment] = HeroDisplayModel.format(hero.biography.alignment)
        values[.firstAppearance] = HeroDisplayModel.format(hero.biography.firstAppearance)
        values[.placeOfBirth] = HeroDisplayModel.format(hero.biography.placeOfBirth)
        values[.occupation] = HeroDisplayModel.format(hero.work.occupation)
        values[.base] = HeroDisplayModel.format(hero.work.base)
        values[.gender] = HeroDisplayModel.format(hero.appearance.gender)
        values[.race] = HeroDisplayModel.format(hero.appearance.race)
        values[.height] = HeroDisplayModel.formatList(hero.appearance.height)
        values[.weight] = HeroDisplayModel.formatList(hero.appearance.weight)
        values[.intelligence] = HeroDisplayModel.format(hero.powerstats.intelligence)
        values[.strength] = HeroDisplayModel.format(hero.powerstats.strength)
        values[.speed] = HeroDisplayModel.format(hero.powerstats.speed)
        values[.durability] = HeroDisplayModel.format(hero.powerstats.durability)
        values[.power] = HeroDisplayModel.format(hero.powerstats.power)
        values[.combat] = HeroDisplayModel.format(hero.powerstats.combat)

        attributeValues = values
    }

    func value(for attribute: Attribute) -> String {
        attributeValues[attribute] ?? "Unknown"
    }
}

private extension HeroDisplayModel {
    static func resolvePrimaryAlias(from hero: Superhero) -> String {
        if let fullName = hero.biography.fullName, !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return fullName
        }
        if let alias = hero.biography.aliases?.first(where: { !$0.trimmingCharacters(in: .whitespaces).isEmpty }) {
            return alias
        }
        return "Identity unknown"
    }

    static func format(_ value: String?) -> String {
        guard let trimmed = value?.trimmingCharacters(in: .whitespacesAndNewlines), !trimmed.isEmpty, trimmed != "-" else {
            return "Unknown"
        }
        return trimmed.capitalizedIfNeeded()
    }

    static func format(_ number: Int?) -> String {
        guard let number else { return "Unknown" }
        return "\(number)"
    }

    static func formatList(_ values: [String]?) -> String {
        guard let values else { return "Unknown" }
        let filtered = values
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty && $0 != "-" }
        return filtered.isEmpty ? "Unknown" : filtered.joined(separator: " / ")
    }
}

private extension String {
    func capitalizedIfNeeded() -> String {
        guard containsUppercasedCharacters else {
            return capitalized
        }
        return self
    }

    private var containsUppercasedCharacters: Bool {
        rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
    }
}

