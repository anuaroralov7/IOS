import Kingfisher
import UIKit

final class ImageLoader {
    static let shared = ImageLoader()

    @discardableResult
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) -> DownloadTask? {
        let resource = ImageResource(downloadURL: url)
        return KingfisherManager.shared.retrieveImage(with: resource, options: [.cacheOriginalImage]) { result in
            switch result {
            case .success(let value):
                completion(.success(value.image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

