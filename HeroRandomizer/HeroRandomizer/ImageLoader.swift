import UIKit

final class ImageLoader {
    enum LoaderError: LocalizedError {
        case invalidImageData

        var errorDescription: String? {
            switch self {
            case .invalidImageData:
                return "Unable to render the superhero image."
            }
        }
    }

    static let shared = ImageLoader()

    private let cache = NSCache<NSURL, UIImage>()
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    @discardableResult
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) -> URLSessionDataTask? {
        let cacheKey = url as NSURL

        if let cachedImage = cache.object(forKey: cacheKey) {
            completion(.success(cachedImage))
            return nil
        }

        let task = session.dataTask(with: url) { [weak self] data, _, error in
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(.failure(LoaderError.invalidImageData))
                }
                return
            }

            self?.cache.setObject(image, forKey: cacheKey)

            DispatchQueue.main.async {
                completion(.success(image))
            }
        }

        task.resume()
        return task
    }
}

