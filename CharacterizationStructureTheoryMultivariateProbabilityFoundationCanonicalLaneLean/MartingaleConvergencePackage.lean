import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure MartingaleConvergencePackage where
  filteredSpace : Type u
  filtration : Type v
  martingaleFamily : Type w
  integrabilityCondition : Prop
  convergenceInProbability : Prop
  almostSureConvergence : Prop

structure MartingaleConvergenceEvidence (M : MartingaleConvergencePackage) where
  integrabilityConditionClosed : M.integrabilityCondition
  convergenceInProbabilityClosed : M.convergenceInProbability
  almostSureConvergenceClosed : M.almostSureConvergence

def MartingaleConvergenceClosed (M : MartingaleConvergencePackage) : Prop :=
  M.integrabilityCondition ∧ M.convergenceInProbability ∧ M.almostSureConvergence

theorem martingale_convergence_closed_from_evidence
    (M : MartingaleConvergencePackage) (E : MartingaleConvergenceEvidence M) :
    MartingaleConvergenceClosed M := by
  exact And.intro E.integrabilityConditionClosed
    (And.intro E.convergenceInProbabilityClosed E.almostSureConvergenceClosed)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
