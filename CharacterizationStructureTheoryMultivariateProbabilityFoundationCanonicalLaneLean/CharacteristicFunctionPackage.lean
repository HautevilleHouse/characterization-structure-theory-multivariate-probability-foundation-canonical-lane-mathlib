import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure CharacteristicFunctionPackage where
  randomVector : Type u
  characteristicFunctionDefined : Prop
  inversionFormula : Prop
  uniquenessTheorem : Prop
  continuityTheorem : Prop
  levyContinuity : Prop

structure CharacteristicFunctionEvidence (C : CharacteristicFunctionPackage) where
  characteristicFunctionDefinedClosed : C.characteristicFunctionDefined
  inversionFormulaClosed : C.inversionFormula
  uniquenessTheoremClosed : C.uniquenessTheorem
  continuityTheoremClosed : C.continuityTheorem
  levyContinuityClosed : C.levyContinuity

def CharacteristicFunctionClosed (C : CharacteristicFunctionPackage) : Prop :=
  C.characteristicFunctionDefined ∧ C.inversionFormula ∧ C.uniquenessTheorem ∧
  C.continuityTheorem ∧ C.levyContinuity

theorem characteristic_function_closed_from_evidence
    (C : CharacteristicFunctionPackage) (E : CharacteristicFunctionEvidence C) :
    CharacteristicFunctionClosed C := by
  exact And.intro E.characteristicFunctionDefinedClosed
    (And.intro E.inversionFormulaClosed
      (And.intro E.uniquenessTheoremClosed
        (And.intro E.continuityTheoremClosed E.levyContinuityClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
