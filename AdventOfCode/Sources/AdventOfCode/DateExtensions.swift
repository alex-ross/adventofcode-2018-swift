import Foundation

public extension Date {
    init?(fromString dateString: String, withFormat format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: dateString) else { return nil }

        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
}
