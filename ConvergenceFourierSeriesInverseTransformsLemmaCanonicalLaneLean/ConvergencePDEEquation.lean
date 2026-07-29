import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure ConvergencePDEPackage where
  timeParameter : Type u
  spatialDomain : Type v
  kernelFunction : Type w
  pdeFormulation : Prop
  parabolicRegularity : Prop
  wellposedness : Prop

structure ConvergencePDEEvidence (P : ConvergencePDEPackage) where
  pdeFormulationClosed : P.pdeFormulation
  parabolicRegularityClosed : P.parabolicRegularity
  wellposednessClosed : P.wellposedness

def ConvergencePDEClosed (P : ConvergencePDEPackage) : Prop :=
  P.pdeFormulation ∧ P.parabolicRegularity ∧ P.wellposedness

theorem convergence_pde_closed_from_evidence (P : ConvergencePDEPackage)
    (E : ConvergencePDEEvidence P) : ConvergencePDEClosed P := by
  exact And.intro E.pdeFormulationClosed
    (And.intro E.parabolicRegularityClosed E.wellposednessClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse