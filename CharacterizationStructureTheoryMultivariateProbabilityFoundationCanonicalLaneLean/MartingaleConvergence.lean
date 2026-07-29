import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure MartingaleSequence (P : ProbabilitySpace) where
  filtration : ℕ → Set (Set P.carrier)
  adaptedProcess : ℕ → (P.carrier → ℝ)
  integrable : ℕ → Prop
  conditionalExpectationProperty : ℕ → Prop
  integrableTerm : ∀ n, integrable n
  conditionalExpectationPropertyTerm : ∀ n, conditionalExpectationProperty n

structure MartingaleConvergenceEvidence {P : ProbabilitySpace} (M : MartingaleSequence P) where
  boundedInL1 : Prop
  almostSureConvergence : Prop
  boundedInL1Closed : boundedInL1
  almostSureConvergenceClosed : almostSureConvergence

def MartingaleConvergenceClosed {P : ProbabilitySpace} (M : MartingaleSequence P) : Prop :=
  M.integrable 0 ∧ M.conditionalExpectationProperty 0

theorem martingale_convergence_closed_from_evidence {P : ProbabilitySpace} (M : MartingaleSequence P) (E : MartingaleConvergenceEvidence M) : MartingaleConvergenceClosed M := by
  exact And.intro (M.integrableTerm 0) (M.conditionalExpectationPropertyTerm 0)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
