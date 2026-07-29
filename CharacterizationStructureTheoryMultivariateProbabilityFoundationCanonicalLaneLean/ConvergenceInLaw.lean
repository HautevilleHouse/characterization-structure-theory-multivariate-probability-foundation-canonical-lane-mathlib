import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.CharacteristicFunction

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure ConvergenceInLaw (Ω : ProbabilitySpace) (d : ℕ) where
  probabilityMeasures : ℕ → ProbabilitySpace
  limitMeasure : ProbabilitySpace
  forAllContinuousBounded : ∀ (f : ℝ^d -> ℝ), Continuous f → Bounded f → limit (λ n => ∫ x, f x d(probabilityMeasures n).probabilityMeasure) = ∫ x, f x d(limitMeasure.probabilityMeasure)
  cfConverges : ∀ t : ℝ^d, limit (λ n => (characteristicFunction (randomVectorFromMeasure (probabilityMeasures n) d) d).cf t) = (characteristicFunction (randomVectorFromMeasure limitMeasure d) d).cf t

def ConvergenceInLawClosed (Ω : ProbabilitySpace) (d : ℕ) (seq : ConvergenceInLaw Ω d) : Prop :=
  seq.forAllContinuousBounded ∧ seq.cfConverges

theorem convergence_in_law_closed (Ω : ProbabilitySpace) (d : ℕ) (seq : ConvergenceInLaw Ω d) : ConvergenceInLawClosed Ω d seq :=
  And.intro seq.forAllContinuousBounded seq.cfConverges

theorem levy_continuity (Ω : ProbabilitySpace) (d : ℕ) (seq : ConvergenceInLaw Ω d) : ConvergenceInLawClosed Ω d seq := by
  exact convergence_in_law_closed Ω d seq

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse