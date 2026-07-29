import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FourierCoefficientsPackage where
  coefficientsDefined : (ℕ → ℝ) → (ℕ → ℝ)
  decayProperty : Prop
  riemannLebesgueLemma : Prop
  besselInequality : Prop

structure FourierCoefficientsEvidence (F : FourierCoefficientsPackage) where
  coefficientsDefinedClosed : True
  decayPropertyClosed : F.decayProperty
  riemannLebesgueLemmaClosed : F.riemannLebesgueLemma
  besselInequalityClosed : F.besselInequality

def FourierCoefficientsClosed (F : FourierCoefficientsPackage) : Prop :=
  F.decayProperty ∧ F.riemannLebesgueLemma ∧ F.besselInequality

theorem fourier_coefficients_closed_from_evidence
    (F : FourierCoefficientsPackage) (E : FourierCoefficientsEvidence F) :
    FourierCoefficientsClosed F :=
  And.intro E.decayPropertyClosed
    (And.intro E.riemannLebesgueLemmaClosed E.besselInequalityClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse