import canonicalLaneMathlib.AdmissibleClass
import ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure FourierAdmittedObject where
  space : FourierSpace
  closedThreeManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

structure FourierSpace where
  carrier : Type
  topology : TopologicalSpace carrier

def FourierWitnessClosed (O : FourierAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse