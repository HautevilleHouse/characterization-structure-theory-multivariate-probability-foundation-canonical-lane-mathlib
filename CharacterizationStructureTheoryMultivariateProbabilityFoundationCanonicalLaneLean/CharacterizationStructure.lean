import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Probability.Kernel

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure CharacterizationStructurePackage where
  indexSet : Type
  projectionFamily : indexSet → (Ω → ℝ) where
  consistencyCondition : Prop
  kolmogorovExtension : Prop
  uniqueness : Prop

structure CharacterizationStructureEvidence (C : CharacterizationStructurePackage) where
  consistencyConditionClosed : C.consistencyCondition
  kolmogorovExtensionClosed : C.kolmogorovExtension
  uniquenessClosed : C.uniqueness

def CharacterizationStructureClosed (C : CharacterizationStructurePackage) : Prop :=
  C.consistencyCondition ∧ C.kolmogorovExtension ∧ C.uniqueness

theorem characterization_structure_closed_from_evidence
    (C : CharacterizationStructurePackage) (E : CharacterizationStructureEvidence C) :
    CharacterizationStructureClosed C := by
  exact And.intro E.consistencyConditionClosed (And.intro E.kolmogorovExtensionClosed E.uniquenessClosed)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
