import CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure ProbabilityMeasurePackage where
  probabilitySpace : ProbabilitySpace
  productMeasure : Prop
  conditionalExpectationConstructed : Prop
  disintegration : Prop
  measureConvergenceModes : Prop

structure ProbabilityMeasureEvidence (P : ProbabilityMeasurePackage) where
  productMeasureClosed : P.productMeasure
  conditionalExpectationClosed : P.conditionalExpectationConstructed
  disintegrationClosed : P.disintegration
  measureConvergenceModesClosed : P.measureConvergenceModes

def ProbabilityMeasureClosed (P : ProbabilityMeasurePackage) : Prop :=
  P.productMeasure ∧ P.conditionalExpectationConstructed ∧
  P.disintegration ∧ P.measureConvergenceModes

theorem probability_measure_closed_from_evidence
    (P : ProbabilityMeasurePackage) (E : ProbabilityMeasureEvidence P) :
    ProbabilityMeasureClosed P := by
  exact And.intro E.productMeasureClosed
    (And.intro E.conditionalExpectationClosed
      (And.intro E.disintegrationClosed E.measureConvergenceModesClosed))

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse