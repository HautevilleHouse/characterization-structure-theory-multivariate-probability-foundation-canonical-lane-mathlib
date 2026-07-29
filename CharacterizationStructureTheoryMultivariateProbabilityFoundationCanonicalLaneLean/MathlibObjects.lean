import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Probability.Kernel

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type
  sigmaAlgebra : MeasurableSpace carrier
  probabilityMeasure : Measure carrier

structure MultivariateProbabilityAdmittedObject where
  space : ProbabilitySpace
  finiteDimensionalDistributionsProp : Prop
  consistentKernelProp : Prop
  kolmogorovExtensionProp : Prop
  conclusion : finiteDimensionalDistributionsProp ∧ consistentKernelProp ∧ kolmogorovExtensionProp

def MultivariateProbabilityWitnessClosed (O : MultivariateProbabilityAdmittedObject) : Prop :=
  O.finiteDimensionalDistributionsProp ∧ O.consistentKernelProp ∧ O.kolmogorovExtensionProp

end CharacterizationStructureTheoryMultivariateProbabilityFoundationCanonicalLaneLean
end HautevilleHouse
