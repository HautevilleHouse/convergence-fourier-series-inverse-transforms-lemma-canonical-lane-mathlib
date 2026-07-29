import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FourierSeriesPackage where
  functionSpace : Type u
  normedSpace : Type v
  fourierCoefficients : Type w
  dirichletKernel : Type x
  partialSumsConvergence : Prop
  spectrumDecay : Prop

structure FourierSeriesEvidence (F : FourierSeriesPackage) where
  partialSumsConvergenceClosed : F.partialSumsConvergence
  spectrumDecayClosed : F.spectrumDecay

def FourierSeriesClosed (F : FourierSeriesPackage) : Prop :=
  F.partialSumsConvergence ∧ F.spectrumDecay

theorem fourier_series_closed_from_evidence (F : FourierSeriesPackage)
    (E : FourierSeriesEvidence F) : FourierSeriesClosed F := by
  exact And.intro E.partialSumsConvergenceClosed E.spectrumDecayClosed

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse