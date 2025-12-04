import Foundation

final class SuperheroService {
    enum ServiceError: LocalizedError {
        case invalidResponse
        case emptyPayload

        var errorDescription: String? {
            switch self {
            case .invalidResponse:
                return "Received an unexpected response from the server."
            case .emptyPayload:
                return "No data was returned from the server."
            }
        }
    }

    static let shared = SuperheroService()

    private let session: URLSession
    private let decoder: JSONDecoder
    private let allHeroesURL = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!

    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func fetchAllHeroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        let request = URLRequest(url: allHeroesURL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 30)

        let task = session.dataTask(with: request) { [decoder] data, response, error in
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode
            else {
                DispatchQueue.main.async {
                    completion(.failure(ServiceError.invalidResponse))
                }
                return
            }

            guard let data else {
                DispatchQueue.main.async {
                    completion(.failure(ServiceError.emptyPayload))
                }
                return
            }

            do {
                let heroes = try decoder.decode([Superhero].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(heroes))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }
}

