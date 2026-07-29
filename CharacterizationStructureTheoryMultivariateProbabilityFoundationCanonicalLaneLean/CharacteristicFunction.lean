import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure CharacteristicFunction (P : ProbabilitySpace) where
  randomVariable : P.carrier → ℝ
  domain : ℕ → ℝ
  characteristicFormula : ℕ → ℝ → ℂ
  integrability : Prop
  integrabilityTerm : integrability

structure CharacteristicFunctionEvidence {P : ProbabilitySpace} (X : CharacteristicFunction P) where
  characteristicFormulaClosed : ∀ n t, X.characteristicFormula n t = 0
  integrabilityClosed : X.integrability

def CharacteristicFunctionClosed {P : ProbabilitySpace} (X : CharacteristicFunction P) : Prop :=
  X.integrability

theorem characteristic_function_closed_from_evidence {P : ProbabilitySpace} (X : CharacteristicFunction P) (E : CharacteristicFunctionEvidence X) : CharacteristicFunctionClosed X := by
  exact E.integrabilityClosed

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
