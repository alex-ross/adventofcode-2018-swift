import Foundation

public struct DayThreeLib {
    public static func numberOfSquareInchesWithTwoOrMoreClaims(inClaims claims: [Claim]) -> Int {
        return numberOfClaimsPerSquareInch(inClaims: claims).filter({ $0.value > 1 }).count
    }

    public static func firstClaimNotOverlappingAnyOther(inClaims claims: [Claim]) -> Claim? {
        let dict = numberOfClaimsPerSquareInch(inClaims: claims)

        for claim in claims {
            var isOverlapping = false
            for squareInch in claim.squareInchesCoordinates {
                if let xy = dict[squareInch], xy > 1 {
                    isOverlapping = true
                }
            }

            guard isOverlapping else { return claim }
        }

        return nil
    }

    private static func numberOfClaimsPerSquareInch(inClaims claims: [Claim]) -> [String: Int] {
        var dict: [String: Int] = [:]

        for claim in claims {
            for squareInch in claim.squareInchesCoordinates {
                if dict[squareInch] != nil {
                    dict[squareInch]! += 1
                } else {
                    dict[squareInch] = 1
                }
            }
        }

        return dict
    }

}
