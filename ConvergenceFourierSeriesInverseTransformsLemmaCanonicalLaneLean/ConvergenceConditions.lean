import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure ConvergenceConditionsPackage where
  integrabilityCondition : Prop
  boundedVariationCondition : Prop
  piecewiseSmoothCondition : Prop
  limitCondition : Prop

structure ConvergenceConditionsEvidence (C : ConvergenceConditionsPackage) where
  integrabilityConditionClosed : C.integrabilityCondition
  boundedVariationConditionClosed : C.boundedVariationCondition
  piecewiseSmoothConditionClosed : C.piecewiseSmoothCondition
  limitConditionClosed : C.limitCondition

def ConvergenceConditionsClosed (C : ConvergenceConditionsPackage) : Prop :=
  C.integrabilityCondition ∧ C.boundedVariationCondition ∧
  C.piecewiseSmoothCondition ∧ C.limitCondition

theorem convergence_conditions_closed_from_evidence
    (C : ConvergenceConditionsPackage) (E : ConvergenceConditionsEvidence C) :
    ConvergenceConditionsClosed C :=
  And.intro E.integrabilityConditionClosed
    (And.intro E.boundedVariationConditionClosed
      (And.intro E.piecewiseSmoothConditionClosed E.limitConditionClosed))

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse