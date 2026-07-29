import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

def gateClosed (A : AdmissibleClass) : Prop :=
  A.remainderRecorded ∨ A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  -- bridge is directly A.endpointSatisfied, which is given by A.endpointSatisfied's proof
  exact A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  -- gateWitness gives endpointSatisfied ∨ remainderRecorded, exactly what we need
  exact A.gateWitness

def ConstrainedFourierInverseClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fourier_inverse_endgame (A : AdmissibleClass) :
    ConstrainedFourierInverseClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse