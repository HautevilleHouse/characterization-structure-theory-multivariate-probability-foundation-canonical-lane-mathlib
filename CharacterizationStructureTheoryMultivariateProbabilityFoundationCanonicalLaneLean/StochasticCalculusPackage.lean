import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure StochasticCalculusPackage where
  integrator : Type u
  integrand : Type v
  itoIntegralDefined : Prop
  quadraticVariationEquals : Prop
  itoFormulaHolds : Prop
  localMartingaleProperty : Prop

structure StochasticCalculusEvidence (S : StochasticCalculusPackage) where
  itoIntegralDefinedClosed : S.itoIntegralDefined
  quadraticVariationEqualsClosed : S.quadraticVariationEquals
  itoFormulaHoldsClosed : S.itoFormulaHolds
  localMartingalePropertyClosed : S.localMartingaleProperty

def StochasticCalculusClosed (S : StochasticCalculusPackage) : Prop :=
  S.itoIntegralDefined ∧ S.quadraticVariationEquals ∧ S.itoFormulaHolds ∧ S.localMartingaleProperty

theorem stochastic_calculus_closed_from_evidence
    (S : StochasticCalculusPackage) (E : StochasticCalculusEvidence S) :
    StochasticCalculusClosed S := by
  exact And.intro E.itoIntegralDefinedClosed
    (And.intro E.quadraticVariationEqualsClosed
      (And.intro E.itoFormulaHoldsClosed E.localMartingalePropertyClosed))

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
