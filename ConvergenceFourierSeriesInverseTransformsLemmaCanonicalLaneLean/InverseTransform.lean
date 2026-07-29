import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure InverseTransformPackage where
  inverseDefined : (ℕ → ℝ) → ℝ → ℝ
  partialSumInverse : ℕ → ℝ → ℝ
  inversionFormula : Prop
  pointwiseConvergence : Prop

structure InverseTransformEvidence (I : InverseTransformPackage) where
  inverseDefinedClosed : True
  partialSumInverseClosed : True
  inversionFormulaClosed : I.inversionFormula
  pointwiseConvergenceClosed : I.pointwiseConvergence

def InverseTransformClosed (I : InverseTransformPackage) : Prop :=
  I.inversionFormula ∧ I.pointwiseConvergence

theorem inverse_transform_closed_from_evidence
    (I : InverseTransformPackage) (E : InverseTransformEvidence I) :
    InverseTransformClosed I :=
  And.intro E.inversionFormulaClosed E.pointwiseConvergenceClosed

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse