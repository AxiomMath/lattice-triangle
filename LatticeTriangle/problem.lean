import Mathlib

def largestPrimeFactor (n : ℕ) : ℕ :=
  WithBot.unbotD 0 n.primeFactors.max

def truncatedObtuseRegion (n : ℕ) (η : ℝ) : Set (ℤ × ℤ) :=
  {pq : ℤ × ℤ |
    η * (n : ℝ) ≤ (pq.1 : ℝ) ∧
    η * (n : ℝ) ≤ (pq.2 : ℝ) ∧
    (pq.1 : ℝ) + (pq.2 : ℝ) < (n : ℝ) / 2 ∧
    Int.gcd (Int.gcd pq.1 pq.2) (n : ℤ) = 1}

def intervalSet (n : ℕ) (m : ℕ) : Set (ZMod n) :=
  {x : ZMod n | 1 ≤ ZMod.val x ∧ ZMod.val x ≤ m}

instance intervalSet_decidableMem (n : ℕ) (m : ℕ) :
    DecidablePred (· ∈ intervalSet n m) :=
  fun _ => instDecidableAnd

def countingFunctionS (n : ℕ) (p q : ℤ) : ℕ :=
  if h : n = 0 then 0
  else
    haveI : NeZero n := ⟨h⟩
    let mp := (2 * p - 1).toNat
    let mq := (2 * q - 1).toNat
    (Finset.univ.filter fun a : (ZMod n)ˣ =>
      (a.val * (p : ZMod n)) ∈ intervalSet n mp ∧
      (a.val * (q : ZMod n)) ∈ intervalSet n mq).card

def badPairsSet (n : ℕ) (η : ℝ) : Set (ℤ × ℤ) :=
  {pq ∈ truncatedObtuseRegion n η |
    Int.gcd pq.2 (largestPrimeFactor n : ℤ) = 1 ∧
    countingFunctionS n pq.1 pq.2 < 5}

theorem analyticEngine_lower_bound (η : ℝ) (θ : ℝ)
    (hη_pos : 0 < η) (hη_lt : η < 1 / 6) (hθ_pos : 0 < θ) (hθ_lt : θ < 1) :
    ∀ ε : ℝ, 0 < ε →
      ∃ N₀ : ℕ, ∀ n : ℕ, N₀ ≤ n →
        (largestPrimeFactor n : ℝ) ≥ (n : ℝ) ^ θ →
        ((badPairsSet n η).ncard : ℝ) / ((truncatedObtuseRegion n η).ncard : ℝ) < ε := sorry
