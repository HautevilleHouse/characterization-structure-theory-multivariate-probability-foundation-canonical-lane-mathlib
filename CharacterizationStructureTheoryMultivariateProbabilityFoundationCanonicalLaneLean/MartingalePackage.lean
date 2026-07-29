import CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean.StochasticCalculus

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure MartingalePackage {C : StochasticCalculusPackage} where
  martingaleDefinition : Prop
  optionalStoppingTheorem : Prop
  martingaleConvergence : Prop
  localMartingaleStructure : Prop
  martingaleRepresentation : Prop

structure MartingaleEvidence {C : StochasticCalculusPackage} (M : MartingalePackage C) where
  martingaleDefinitionClosed : M.martingaleDefinition
  optionalStoppingTheoremClosed : M.optionalStoppingTheorem
  martingaleConvergenceClosed : M.martingaleConvergence
  localMartingaleStructureClosed : M.localMartingaleStructure
  martingaleRepresentationClosed : M.martingaleRepresentation

def MartingaleClosed {C : StochasticCalculusPackage} (M : MartingalePackage C) : Prop :=
  M.martingaleDefinition ∧ M.optionalStoppingTheorem ∧ M.martingaleConvergence ∧
  M.localMartingaleStructure ∧ M.martingaleRepresentation

theorem martingale_closed_from_evidence {C : StochasticCalculusPackage}
    (M : MartingalePackage C) (E : MartingaleEvidence M) : MartingaleClosed M := by
  exact And.intro E.martingaleDefinitionClosed
    (And.intro E.optionalStoppingTheoremClosed
      (And.intro E.martingaleConvergenceClosed
        (And.intro E.localMartingaleStructureClosed E.martingaleRepresentationClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse