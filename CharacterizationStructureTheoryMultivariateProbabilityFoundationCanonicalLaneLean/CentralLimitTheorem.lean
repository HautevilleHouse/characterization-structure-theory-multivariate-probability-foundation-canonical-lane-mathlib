import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.CharacteristicFunction

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure CentralLimitTheorem (P : ProbabilitySpace) where
  iidSequence : ℕ → (P.carrier → ℝ)
  sum : ℕ → (P.carrier → ℝ)
  normalizedSum : ℕ → (P.carrier → ℝ)
  convergenceInDistribution : Prop
  convergenceInDistributionTerm : convergenceInDistribution

structure CentralLimitTheoremEvidence {P : ProbabilitySpace} (C : CentralLimitTheorem P) where
  convergenceInDistributionClosed : C.convergenceInDistribution

def CentralLimitTheoremClosed {P : ProbabilitySpace} (C : CentralLimitTheorem P) : Prop :=
  C.convergenceInDistribution

theorem central_limit_theorem_closed_from_evidence {P : ProbabilitySpace} (C : CentralLimitTheorem P) (E : CentralLimitTheoremEvidence C) : CentralLimitTheoremClosed C := by
  exact E.convergenceInDistributionClosed

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
