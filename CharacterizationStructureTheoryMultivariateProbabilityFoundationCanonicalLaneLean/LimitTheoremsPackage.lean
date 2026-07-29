import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure LimitTheoremsPackage where
  lawLargeNumbers : Prop
  centralLimitTheorem : Prop
  weakConvergence : Prop
  characteristicFunctionMethod : Prop
  berryEsseenBound : Prop

structure LimitTheoremsEvidence (L : LimitTheoremsPackage) where
  lawLargeNumbersClosed : L.lawLargeNumbers
  centralLimitTheoremClosed : L.centralLimitTheorem
  weakConvergenceClosed : L.weakConvergence
  characteristicFunctionMethodClosed : L.characteristicFunctionMethod
  berryEsseenBoundClosed : L.berryEsseenBound

def LimitTheoremsClosed (L : LimitTheoremsPackage) : Prop :=
  L.lawLargeNumbers ∧ L.centralLimitTheorem ∧ L.weakConvergence ∧
  L.characteristicFunctionMethod ∧ L.berryEsseenBound

theorem limit_theorems_closed_from_evidence
    (L : LimitTheoremsPackage) (E : LimitTheoremsEvidence L) :
    LimitTheoremsClosed L := by
  exact And.intro E.lawLargeNumbersClosed
    (And.intro E.centralLimitTheoremClosed
      (And.intro E.weakConvergenceClosed
        (And.intro E.characteristicFunctionMethodClosed E.berryEsseenBoundClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
