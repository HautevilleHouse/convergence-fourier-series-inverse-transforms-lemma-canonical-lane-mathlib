import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FourierSeriesPackage where
  seriesType : Type u
  coefficientsSequence : Type v
  convergenceCondition : Prop
  domainCompactness : Prop
  functionRegularity : Prop

structure FourierSeriesEvidence (F : FourierSeriesPackage) where
  convergenceConditionClosed : F.convergenceCondition
  domainCompactnessClosed : F.domainCompactness
  functionRegularityClosed : F.functionRegularity

def FourierSeriesClosed (F : FourierSeriesPackage) : Prop :=
  F.convergenceCondition ∧ F.domainCompactness ∧ F.functionRegularity

theorem fourier_series_closed_from_evidence (F : FourierSeriesPackage)
    (E : FourierSeriesEvidence F) : FourierSeriesClosed F := by
  exact And.intro E.convergenceConditionClosed
    (And.intro E.domainCompactnessClosed E.functionRegularityClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse