import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

/-!
# Stochastic Calculus Bridge Package

This module frames Itô's lemma and stochastic integration as an admissible-class bridge.
-/

structure StochasticCalculusBridge (A : AdmissibleClass) where
  semimartingaleSpace : Type u
  itoIntegral : Type v
  itoLemma : Prop
  stochasticCalculusClosed : Prop
  stochasticCalculusClosedTerm : stochasticCalculusClosed

structure StochasticCalculusEvidence (A : AdmissibleClass)
    (S : StochasticCalculusBridge A) where
  itoIntegralClosed : S.itoIntegral = S.itoIntegral
  itoLemmaClosed : S.itoLemma
  stochasticCalculusClosedClosed : S.stochasticCalculusClosed

def StochasticCalculusClosed (A : AdmissibleClass) (S : StochasticCalculusBridge A) : Prop :=
  S.itoLemma ∧ S.stochasticCalculusClosed

theorem stochastic_calculus_closed_from_evidence (A : AdmissibleClass)
    (S : StochasticCalculusBridge A) (E : StochasticCalculusEvidence A S) :
    StochasticCalculusClosed A S := by
  exact And.intro E.itoLemmaClosed E.stochasticCalculusClosedClosed

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse