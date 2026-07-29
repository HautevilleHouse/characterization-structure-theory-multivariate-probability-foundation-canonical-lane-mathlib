import CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def characterizationProjection : Projection ProbabilityEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem characterization_projection_idempotent (x : ProbabilityEndgameState) :
    characterizationProjection.toFun (characterizationProjection.toFun x) = characterizationProjection.toFun x := by
  exact characterizationProjection.idempotent x

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse