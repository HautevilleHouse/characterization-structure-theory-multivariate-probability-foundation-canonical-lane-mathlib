import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure StochasticProcess (P : ProbabilitySpace) where
  indexSet : Type u
  process : indexSet → (P.carrier → ℝ)
  adapted : Prop
  adaptedTerm : adapted

structure ItoIntegral (P : ProbabilitySpace) {I : Type u} (X : StochasticProcess P) where
  integrand : I → (P.carrier → ℝ)
  integral : I → (P.carrier → ℝ)
  isometryProperty : Prop
  martingaleProperty : Prop
  isometryPropertyTerm : isometryProperty
  martingalePropertyTerm : martingaleProperty

structure StochasticCalculusEvidence {P : ProbabilitySpace} {I : Type u} {X : StochasticProcess P} (S : ItoIntegral P X) where
  isometryPropertyClosed : S.isometryProperty
  martingalePropertyClosed : S.martingaleProperty

def StochasticCalculusClosed {P : ProbabilitySpace} {I : Type u} {X : StochasticProcess P} (S : ItoIntegral P X) : Prop :=
  S.isometryProperty ∧ S.martingaleProperty

theorem stochastic_calculus_closed_from_evidence {P : ProbabilitySpace} {I : Type u} {X : StochasticProcess P} (S : ItoIntegral P X) (E : StochasticCalculusEvidence S) : StochasticCalculusClosed S := by
  exact And.intro E.isometryPropertyClosed E.martingalePropertyClosed

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
