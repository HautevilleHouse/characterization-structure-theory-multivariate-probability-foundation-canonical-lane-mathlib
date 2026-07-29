import CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.MartingalePackage

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure LimitTheoremPackage {S : MartingalePackage} where
  strongLawOfLargeNumbers : Prop
  centralLimitTheorem : Prop
  lawOfIteratedLogarithm : Prop
  convergenceOfMeasures : Prop
  functionalConvergence : Prop

structure LimitTheoremEvidence {S : MartingalePackage} (L : LimitTheoremPackage S) where
  strongLawClosed : L.strongLawOfLargeNumbers
  centralLimitClosed : L.centralLimitTheorem
  lawOfIteratedLogarithmClosed : L.lawOfIteratedLogarithm
  convergenceOfMeasuresClosed : L.convergenceOfMeasures
  functionalConvergenceClosed : L.functionalConvergence

def LimitTheoremClosed {S : MartingalePackage} (L : LimitTheoremPackage S) : Prop :=
  L.strongLawOfLargeNumbers ∧ L.centralLimitTheorem ∧ L.lawOfIteratedLogarithm ∧
  L.convergenceOfMeasures ∧ L.functionalConvergence

theorem limit_theorem_closed_from_evidence {S : MartingalePackage}
    (L : LimitTheoremPackage S) (E : LimitTheoremEvidence L) : LimitTheoremClosed L := by
  exact And.intro E.strongLawClosed
    (And.intro E.centralLimitClosed
      (And.intro E.lawOfIteratedLogarithmClosed
        (And.intro E.convergenceOfMeasuresClosed E.functionalConvergenceClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse