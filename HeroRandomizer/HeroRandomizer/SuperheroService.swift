import Alamofire
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

    private let session: Session
    private let decoder: JSONDecoder
    private let allHeroesURL = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!

    init(session: Session = .default, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func fetchAllHeroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        session.request(allHeroesURL, method: .get) { request in
            request.timeoutInterval = 30
            request.cachePolicy = .reloadRevalidatingCacheData
        }
        .validate(statusCode: 200..<300)
        .responseDecodable(of: [Superhero].self, queue: .main, decoder: decoder) { response in
            switch response.result {
            case .success(let heroes):
                if heroes.isEmpty {
                    completion(.failure(ServiceError.emptyPayload))
                } else {
                    completion(.success(heroes))
                }
            case .failure(let error):
                if let statusCode = response.response?.statusCode, !(200..<300).contains(statusCode) {
                    completion(.failure(ServiceError.invalidResponse))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}

