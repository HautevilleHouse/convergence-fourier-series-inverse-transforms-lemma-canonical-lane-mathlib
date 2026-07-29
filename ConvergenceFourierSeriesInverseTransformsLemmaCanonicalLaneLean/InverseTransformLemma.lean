import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.ConvergenceFourierSeries

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure InverseTransformPackage {F : FourierSeriesPackage} (Fc : FourierSeriesClosed F) where
  inversionFormula : Prop
  integrabilityCondition : Prop
  pointwiseConvergence : Prop
  kernelSummability : Prop
  inversionFormulaClosed : inversionFormula
  integrabilityConditionClosed : integrabilityCondition
  pointwiseConvergenceClosed : pointwiseConvergence
  kernelSummabilityClosed : kernelSummability

structure InverseTransformEvidence {F : FourierSeriesPackage} {Fc : FourierSeriesClosed F}
    (I : InverseTransformPackage Fc) where
  inversionFormulaClosed : I.inversionFormula
  integrabilityConditionClosed : I.integrabilityCondition
  pointwiseConvergenceClosed : I.pointwiseConvergence
  kernelSummabilityClosed : I.kernelSummability

def InverseTransformClosed {F : FourierSeriesPackage} {Fc : FourierSeriesClosed F}
    (I : InverseTransformPackage Fc) : Prop :=
  I.inversionFormula ∧ I.integrabilityCondition ∧
  I.pointwiseConvergence ∧ I.kernelSummability

theorem inverse_transform_closed_from_evidence {F : FourierSeriesPackage}
    {Fc : FourierSeriesClosed F} (I : InverseTransformPackage Fc)
    (E : InverseTransformEvidence I) : InverseTransformClosed I := by
  exact And.intro E.inversionFormulaClosed
    (And.intro E.integrabilityConditionClosed
      (And.intro E.pointwiseConvergenceClosed E.kernelSummabilityClosed))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse