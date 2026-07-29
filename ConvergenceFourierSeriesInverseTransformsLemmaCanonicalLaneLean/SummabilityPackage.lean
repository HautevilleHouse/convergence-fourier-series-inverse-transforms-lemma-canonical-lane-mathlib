import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure SummabilityPackage where
  cesaroMean : Prop
  abelMean : Prop
  fejerKernel : Prop
  abelPoissonKernel : Prop
  summabilityImpliesConvergence : Prop

structure SummabilityEvidence (S : SummabilityPackage) where
  cesaroMeanClosed : S.cesaroMean
  abelMeanClosed : S.abelMean
  fejerKernelClosed : S.fejerKernel
  abelPoissonKernelClosed : S.abelPoissonKernel
  summabilityImpliesConvergenceClosed : S.summabilityImpliesConvergence

def SummabilityClosed (S : SummabilityPackage) : Prop :=
  S.cesaroMean ∧ S.abelMean ∧ S.fejerKernel ∧ S.abelPoissonKernel ∧ S.summabilityImpliesConvergence

theorem summability_closed_from_evidence (S : SummabilityPackage)
    (E : SummabilityEvidence S) : SummabilityClosed S := by
  exact And.intro E.cesaroMeanClosed
    (And.intro E.abelMeanClosed
      (And.intro E.fejerKernelClosed
        (And.intro E.abelPoissonKernelClosed E.summabilityImpliesConvergenceClosed)))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse