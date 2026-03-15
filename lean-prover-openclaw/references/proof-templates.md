# Proof Templates

## 1) Direct implication
```lean
theorem t (P Q : Prop) : P → Q := by
  intro hP
  -- derive Q from hP
  admit
```

## 2) Biconditional (`↔`)
```lean
theorem t (P Q : Prop) : P ↔ Q := by
  constructor
  · intro hP
    admit
  · intro hQ
    admit
```

## 3) Existential goals
```lean
theorem t : ∃ n : Nat, n + 1 = 2 := by
  refine ⟨1, ?_⟩
  decide
```

## 4) Structured case split
```lean
theorem t (n : Nat) : n = 0 ∨ n ≠ 0 := by
  cases h : n with
  | zero =>
      left
      rfl
  | succ k =>
      right
      intro hEq
      cases hEq
```

## 5) Local lemma pattern
```lean
theorem t (a b c : Nat) (h : a = b) : a + c = b + c := by
  have h1 : a = b := h
  rw [h1]
```

## 6) Rewriting with assumptions
```lean
theorem t (x y : Int) (h : x = y) : x - y = 0 := by
  rw [h]
```

## 7) Simplification with controlled lemma set
```lean
theorem t (P : Prop) : P ∧ True ↔ P := by
  simp
```

Use these as starting points, then replace `admit` with concrete derivations.
