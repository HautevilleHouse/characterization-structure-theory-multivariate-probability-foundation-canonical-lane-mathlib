import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure GaussianProcessPackage where
  indexSet : Type u
  meanFunction : Type v
  covarianceKernel : Type w
  finiteDimensionalDistributions : Prop
  existenceTheorem : Prop
  continuityProperties : Prop

structure GaussianProcessEvidence (G : GaussianProcessPackage) where
  finiteDimensionalDistributionsClosed : G.finiteDimensionalDistributions
  existenceTheoremClosed : G.existenceTheorem
  continuityPropertiesClosed : G.continuityProperties

def GaussianProcessClosed (G : GaussianProcessPackage) : Prop :=
  G.finiteDimensionalDistributions ∧ G.existenceTheorem ∧ G.continuityProperties

theorem gaussian_process_closed_from_evidence
    (G : GaussianProcessPackage) (E : GaussianProcessEvidence G) :
    GaussianProcessClosed G := by
  exact And.intro E.finiteDimensionalDistributionsClosed
    (And.intro E.existenceTheoremClosed E.continuityPropertiesClosed)

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
