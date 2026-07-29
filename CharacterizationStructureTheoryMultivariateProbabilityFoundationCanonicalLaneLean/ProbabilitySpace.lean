import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (carrier -> ℝ) -> ℝ
  measureNonnegative : Prop
  measureOne : Prop
  countableAdditivity : Prop
  measureNonnegativeTerm : measureNonnegative
  measureOneTerm : measureOne
  countableAdditivityTerm : countableAdditivity

structure ProbabilitySpaceEvidence (P : ProbabilitySpace) where
  measureNonnegativeClosed : P.measureNonnegative
  measureOneClosed : P.measureOne
  countableAdditivityClosed : P.countableAdditivity

def ProbabilitySpaceClosed (P : ProbabilitySpace) : Prop :=
  P.measureNonnegative ∧ P.measureOne ∧ P.countableAdditivity

theorem probability_space_closed_from_evidence (P : ProbabilitySpace) (E : ProbabilitySpaceEvidence P) : ProbabilitySpaceClosed P := by
  exact And.intro E.measureNonnegativeClosed (And.intro E.measureOneClosed E.countableAdditivityClosed)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
