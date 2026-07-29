import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (carrier -> ℝ) -> ℝ
  probabilityMeasureNonnegative : ∀ f, probabilityMeasure f ≥ 0
  probabilityMeasureNormalized : probabilityMeasure (λ _ => 1) = 1
  countablyAdditive : ∀ (fs : ℕ → carrier -> ℝ), (∀ n, probabilityMeasure (fs n) ≥ 0) → (∀ x, summable (λ n => fs n x)) → probabilityMeasure (λ x => ∑' n, fs n x) = ∑' n, probabilityMeasure (fs n)

structure RandomVariable (Ω : ProbabilitySpace) (X : Type) where
  measurable : (Ω.carrier -> X) → Prop
  expectation : (Ω.carrier -> ℝ) -> ℝ
  expectationLinear : ∀ f g, expectation (f + g) = expectation f + expectation g
  expectationNonnegative : ∀ f, (∀ ω, f ω ≥ 0) → expectation f ≥ 0
  expectationOfConstant : ∀ c : ℝ, expectation (λ _ => c) = c * Ω.probabilityMeasure (λ _ => 1)

def ProbabilityMeasureClosed (Ω : ProbabilitySpace) : Prop :=
  Ω.probabilityMeasureNonnegative ∧ Ω.probabilityMeasureNormalized ∧ Ω.countablyAdditive

theorem probability_measure_closed (Ω : ProbabilitySpace) : ProbabilityMeasureClosed Ω :=
  And.intro Ω.probabilityMeasureNonnegative (And.intro Ω.probabilityMeasureNormalized Ω.countablyAdditive)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse