import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure ConvergenceEndpointPackage {P : ConvergencePDEPackage}
    {F : FourierCoefficientDecayPackage} {K : InverseTransformKernelPackage}
    (Z : ConvergenceL2TheoryPackage P F K) where
  targetFunction : Type u
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  endpointMatchesFourierInversionStatement : Prop

structure ConvergenceEndpointEvidence {P : ConvergencePDEPackage}
    {F : FourierCoefficientDecayPackage} {K : InverseTransformKernelPackage}
    {Z : ConvergenceL2TheoryPackage P F K}
    (Epkg : ConvergenceEndpointPackage Z) where
  pointwiseConvergenceClosed : Epkg.pointwiseConvergence
  uniformConvergenceClosed : Epkg.uniformConvergence
  endpointMatchesFourierInversionStatementClosed : Epkg.endpointMatchesFourierInversionStatement

def ConvergenceEndpointClosed {P : ConvergencePDEPackage}
    {F : FourierCoefficientDecayPackage} {K : InverseTransformKernelPackage}
    {Z : ConvergenceL2TheoryPackage P F K}
    (Epkg : ConvergenceEndpointPackage Z) : Prop :=
  Epkg.pointwiseConvergence ∧ Epkg.uniformConvergence ∧
  Epkg.endpointMatchesFourierInversionStatement

theorem convergence_endpoint_closed_from_evidence
    {P : ConvergencePDEPackage} {F : FourierCoefficientDecayPackage}
    {K : InverseTransformKernelPackage} {Z : ConvergenceL2TheoryPackage P F K}
    (Epkg : ConvergenceEndpointPackage Z) (E : ConvergenceEndpointEvidence Epkg) :
    ConvergenceEndpointClosed Epkg := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.uniformConvergenceClosed E.endpointMatchesFourierInversionStatementClosed)

theorem convergence_endpoint_supplies_fourier_inversion
    {P : ConvergencePDEPackage} {F : FourierCoefficientDecayPackage}
    {K : InverseTransformKernelPackage} {Z : ConvergenceL2TheoryPackage P F K}
    (Epkg : ConvergenceEndpointPackage Z) :
    Epkg.endpointMatchesFourierInversionStatement :=
  Epkg.endpointMatchesFourierInversionStatement

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse