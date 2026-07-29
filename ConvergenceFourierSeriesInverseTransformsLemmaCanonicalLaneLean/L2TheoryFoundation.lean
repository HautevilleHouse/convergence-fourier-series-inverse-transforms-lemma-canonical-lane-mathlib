import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure ConvergenceL2TheoryPackage {P : ConvergencePDEPackage}
    {F : FourierCoefficientDecayPackage} (K : InverseTransformKernelPackage) where
  l2Convergence : Prop
  parsevalIdentity : Prop
  isometry : Prop
  carlesonHuntCondition : Prop

structure ConvergenceL2TheoryEvidence {P : ConvergencePDEPackage}
    {F : FourierCoefficientDecayPackage} {K : InverseTransformKernelPackage}
    (Z : ConvergenceL2TheoryPackage P F K) where
  l2ConvergenceClosed : Z.l2Convergence
  parsevalIdentityClosed : Z.parsevalIdentity
  isometryClosed : Z.isometry
  carlesonHuntConditionClosed : Z.carlesonHuntCondition

def ConvergenceL2TheoryClosed {P : ConvergencePDEPackage}
    {F : FourierCoefficientDecayPackage} {K : InverseTransformKernelPackage}
    (Z : ConvergenceL2TheoryPackage P F K) : Prop :=
  Z.l2Convergence ∧ Z.parsevalIdentity ∧ Z.isometry ∧ Z.carlesonHuntCondition

theorem convergence_l2_theory_closed_from_evidence
    {P : ConvergencePDEPackage} {F : FourierCoefficientDecayPackage}
    {K : InverseTransformKernelPackage} (Z : ConvergenceL2TheoryPackage P F K)
    (E : ConvergenceL2TheoryEvidence Z) : ConvergenceL2TheoryClosed Z := by
  exact And.intro E.l2ConvergenceClosed
    (And.intro E.parsevalIdentityClosed
      (And.intro E.isometryClosed E.carlesonHuntConditionClosed))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse