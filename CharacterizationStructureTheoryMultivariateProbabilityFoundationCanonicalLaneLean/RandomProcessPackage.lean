import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure RandomProcessPackage where
  stateSpace : Type u
  indexSet : Type v
  kolmogorovExtension : Prop
  separabilityCondition : Prop
  cadlagVersion : Prop
  markovProperty : Prop

structure RandomProcessEvidence (R : RandomProcessPackage) where
  kolmogorovExtensionClosed : R.kolmogorovExtension
  separabilityConditionClosed : R.separabilityCondition
  cadlagVersionClosed : R.cadlagVersion
  markovPropertyClosed : R.markovProperty

def RandomProcessClosed (R : RandomProcessPackage) : Prop :=
  R.kolmogorovExtension ∧ R.separabilityCondition ∧ R.cadlagVersion ∧ R.markovProperty

theorem random_process_closed_from_evidence
    (R : RandomProcessPackage) (E : RandomProcessEvidence R) :
    RandomProcessClosed R := by
  exact And.intro E.kolmogorovExtensionClosed
    (And.intro E.separabilityConditionClosed
      (And.intro E.cadlagVersionClosed E.markovPropertyClosed))

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
