import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

/-!
# Measure Transport Characterization Package

This module defines the measure transport characterization: a probability measure
on a product space is characterized by its family of one-dimensional transports.
-/

structure MeasureTransportCharacterization (A : AdmissibleClass) where
  sourceMeasure : Type u
  targetMeasure : Type v
  transportMap : sourceMeasure → targetMeasure
  characterizationCondition : Prop
  transportClosed : Prop
  transportClosedTerm : transportClosed

structure MeasureTransportEvidence (A : AdmissibleClass) (M : MeasureTransportCharacterization A) where
  characterizationConditionClosed : M.characterizationCondition
  transportClosedClosed : M.transportClosed

def MeasureTransportClosed (A : AdmissibleClass) (M : MeasureTransportCharacterization A) : Prop :=
  M.characterizationCondition ∧ M.transportClosed

theorem measure_transport_closed_from_evidence (A : AdmissibleClass)
    (M : MeasureTransportCharacterization A) (E : MeasureTransportEvidence A M) :
    MeasureTransportClosed A M := by
  exact And.intro E.characterizationConditionClosed E.transportClosedClosed

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse