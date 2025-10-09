import Foundation

public struct Address {
    
    public let street: String
    public let city: String
    public let zipCode: String
    public let country: String
    
    public init(street: String, city: String, zipCode: String, country: String) {
            self.street = street
            self.city = city
            self.zipCode = zipCode
            self.country = country
        }
    
    public var formattedAddress: String {
        return """
        \(street)
        \(city), \(zipCode)
        \(country)
        """
    }
}
