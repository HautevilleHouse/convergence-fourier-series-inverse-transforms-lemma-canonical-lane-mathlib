import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean

structure InverseTransformPackage where
  transformDomain : Type u
  inversionKernel : Type v
  inversionFormula : Prop
  integrabilityCondition : Prop
  uniquenessResult : Prop

structure InverseTransformEvidence (T : InverseTransformPackage) where
  inversionFormulaClosed : T.inversionFormula
  integrabilityConditionClosed : T.integrabilityCondition
  uniquenessResultClosed : T.uniquenessResult

def InverseTransformClosed (T : InverseTransformPackage) : Prop :=
  T.inversionFormula ∧ T.integrabilityCondition ∧ T.uniquenessResult

theorem inverse_transform_closed_from_evidence (T : InverseTransformPackage)
    (E : InverseTransformEvidence T) : InverseTransformClosed T := by
  exact And.intro E.inversionFormulaClosed
    (And.intro E.integrabilityConditionClosed E.uniquenessResultClosed)

end ConvergenceFourierSeriesInverseTransformsLemmaCanonicalLaneLean
end HautevilleHouse