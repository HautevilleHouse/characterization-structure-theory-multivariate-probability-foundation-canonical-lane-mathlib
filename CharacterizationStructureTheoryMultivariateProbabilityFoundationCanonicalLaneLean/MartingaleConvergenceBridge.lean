import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

/-!
# Martingale Convergence Bridge Package

This module frames the martingale convergence theorem as an admissible-class bridge.
-/

structure MartingaleConvergenceBridge (A : AdmissibleClass) where
  martingaleSequence : Type u
  almostSureLimit : Prop
  integrabilityCondition : Prop
  convergenceClosed : Prop
  convergenceClosedTerm : convergenceClosed

structure MartingaleConvergenceEvidence (A : AdmissibleClass)
    (M : MartingaleConvergenceBridge A) where
  almostSureLimitClosed : M.almostSureLimit
  integrabilityConditionClosed : M.integrabilityCondition
  convergenceClosedClosed : M.convergenceClosed

def MartingaleConvergenceClosed (A : AdmissibleClass) (M : MartingaleConvergenceBridge A) : Prop :=
  M.almostSureLimit ∧ M.integrabilityCondition ∧ M.convergenceClosed

theorem martingale_convergence_closed_from_evidence (A : AdmissibleClass)
    (M : MartingaleConvergenceBridge A) (E : MartingaleConvergenceEvidence A M) :
    MartingaleConvergenceClosed A M := by
  exact And.intro E.almostSureLimitClosed
    (And.intro E.integrabilityConditionClosed E.convergenceClosedClosed)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse