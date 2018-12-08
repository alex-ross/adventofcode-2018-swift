public extension Int {
    func times(_ body: (Int) -> ()) {
        (0..<self).forEach(body)
    }
}
