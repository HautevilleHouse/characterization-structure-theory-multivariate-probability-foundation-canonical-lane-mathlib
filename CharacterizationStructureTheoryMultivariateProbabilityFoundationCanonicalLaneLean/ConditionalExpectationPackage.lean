import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure ConditionalExpectationPackage where
  probabilitySpace : Type u
  subSigmaAlgebra : Type v
  integrableRandomVariable : Type w
  conditionalExpectationExists : Prop
  towerProperty : Prop
  positivityProperty : Prop

structure ConditionalExpectationEvidence (C : ConditionalExpectationPackage) where
  conditionalExpectationExistsClosed : C.conditionalExpectationExists
  towerPropertyClosed : C.towerProperty
  positivityPropertyClosed : C.positivityProperty

def ConditionalExpectationClosed (C : ConditionalExpectationPackage) : Prop :=
  C.conditionalExpectationExists ∧ C.towerProperty ∧ C.positivityProperty

theorem conditional_expectation_closed_from_evidence
    (C : ConditionalExpectationPackage) (E : ConditionalExpectationEvidence C) :
    ConditionalExpectationClosed C := by
  exact And.intro E.conditionalExpectationExistsClosed
    (And.intro E.towerPropertyClosed E.positivityPropertyClosed)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
