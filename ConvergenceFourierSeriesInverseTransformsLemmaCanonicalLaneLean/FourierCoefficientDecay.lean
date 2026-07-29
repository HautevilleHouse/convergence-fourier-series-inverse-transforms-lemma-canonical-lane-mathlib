import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FourierCoefficientDecayPackage where
  coefficientSequence : Type u
  decayRate : Prop
  summability : Prop
  holderContinuity : Prop

structure FourierCoefficientDecayEvidence (F : FourierCoefficientDecayPackage) where
  decayRateClosed : F.decayRate
  summabilityClosed : F.summability
  holderContinuityClosed : F.holderContinuity

def FourierCoefficientDecayClosed (F : FourierCoefficientDecayPackage) : Prop :=
  F.decayRate ∧ F.summability ∧ F.holderContinuity

theorem fourier_coefficient_decay_closed_from_evidence
    (F : FourierCoefficientDecayPackage) (E : FourierCoefficientDecayEvidence F) :
    FourierCoefficientDecayClosed F := by
  exact And.intro E.decayRateClosed (And.intro E.summabilityClosed E.holderContinuityClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse