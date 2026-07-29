import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.InverseTransformLemma

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure BoundednessConditionsPackage {F : FourierSeriesPackage} {Fc : FourierSeriesClosed F}
    {I : InverseTransformPackage Fc} (Ic : InverseTransformClosed I) where
  uniformBound : Prop
  pointwiseBound : Prop
  integrableBound : Prop
  uniformBoundClosed : uniformBound
  pointwiseBoundClosed : pointwiseBound
  integrableBoundClosed : integrableBound

structure BoundednessConditionsEvidence {F : FourierSeriesPackage} {Fc : FourierSeriesClosed F}
    {I : InverseTransformPackage Fc} {Ic : InverseTransformClosed I}
    (B : BoundednessConditionsPackage Ic) where
  uniformBoundClosed : B.uniformBound
  pointwiseBoundClosed : B.pointwiseBound
  integrableBoundClosed : B.integrableBound

def BoundednessConditionsClosed {F : FourierSeriesPackage} {Fc : FourierSeriesClosed F}
    {I : InverseTransformPackage Fc} {Ic : InverseTransformClosed I}
    (B : BoundednessConditionsPackage Ic) : Prop :=
  B.uniformBound ∧ B.pointwiseBound ∧ B.integrableBound

theorem boundedness_conditions_closed_from_evidence {F : FourierSeriesPackage}
    {Fc : FourierSeriesClosed F} {I : InverseTransformPackage Fc}
    {Ic : InverseTransformClosed I} (B : BoundednessConditionsPackage Ic)
    (E : BoundednessConditionsEvidence B) : BoundednessConditionsClosed B := by
  exact And.intro E.uniformBoundClosed
    (And.intro E.pointwiseBoundClosed E.integrableBoundClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse