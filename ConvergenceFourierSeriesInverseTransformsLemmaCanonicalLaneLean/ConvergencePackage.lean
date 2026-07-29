import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure ConvergencePackage where
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  normConvergence : Prop
  convergenceRate : Prop

structure ConvergenceEvidence (C : ConvergencePackage) where
  pointwiseConvergenceClosed : C.pointwiseConvergence
  uniformConvergenceClosed : C.uniformConvergence
  normConvergenceClosed : C.normConvergence
  convergenceRateClosed : C.convergenceRate

def ConvergenceClosed (C : ConvergencePackage) : Prop :=
  C.pointwiseConvergence ∧ C.uniformConvergence ∧ C.normConvergence ∧ C.convergenceRate

theorem convergence_closed_from_evidence (C : ConvergencePackage)
    (E : ConvergenceEvidence C) : ConvergenceClosed C := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.uniformConvergenceClosed
      (And.intro E.normConvergenceClosed E.convergenceRateClosed))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse