import HautevilleHouse.ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.FourierSeriesPackage

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : FourierSeriesPackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FourierSeriesClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse