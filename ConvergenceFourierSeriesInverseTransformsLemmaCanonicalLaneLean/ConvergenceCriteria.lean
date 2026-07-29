import ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean.FourierInversionKernel

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure ConvergenceCriteriaPackage {K : FourierInversionKernelPackage}
    (F : FourierIntegralStructure) where
  pointwiseConvergenceCondition : Prop
  uniformConvergenceCondition : Prop
  LpConvergenceCondition : Prop
  cesaroSummabilityCondition : Prop
  abelSummabilityCondition : Prop

structure ConvergenceCriteriaEvidence {K : FourierInversionKernelPackage}
    {F : FourierIntegralStructure} (C : ConvergenceCriteriaPackage F) where
  pointwiseConvergenceConditionClosed : C.pointwiseConvergenceCondition
  uniformConvergenceConditionClosed : C.uniformConvergenceCondition
  LpConvergenceConditionClosed : C.LpConvergenceCondition
  cesaroSummabilityConditionClosed : C.cesaroSummabilityCondition
  abelSummabilityConditionClosed : C.abelSummabilityCondition

def ConvergenceCriteriaClosed {K : FourierInversionKernelPackage}
    {F : FourierIntegralStructure} (C : ConvergenceCriteriaPackage F) : Prop :=
  C.pointwiseConvergenceCondition ∧ C.uniformConvergenceCondition ∧
  C.LpConvergenceCondition ∧ C.cesaroSummabilityCondition ∧ C.abelSummabilityCondition

theorem convergence_criteria_closed_from_evidence
    {K : FourierInversionKernelPackage} {F : FourierIntegralStructure}
    (C : ConvergenceCriteriaPackage F) (E : ConvergenceCriteriaEvidence C) :
    ConvergenceCriteriaClosed C := by
  exact And.intro E.pointwiseConvergenceConditionClosed
    (And.intro E.uniformConvergenceConditionClosed
      (And.intro E.LpConvergenceConditionClosed
        (And.intro E.cesaroSummabilityConditionClosed
          E.abelSummabilityConditionClosed)))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse