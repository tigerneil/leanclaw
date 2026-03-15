# Tactic Playbook

## Goal-shaping tactics
- `intro` / `rintro`: move assumptions into context.
- `constructor`: split conjunction and biconditional goals.
- `refine`: define proof shape while leaving subgoals.
- `have`: state intermediate claims to reduce complexity.
- `suffices`: switch to a strategically easier target.

## Rewrite and simplification
- `rw [h]`: deterministic rewrite; chain multiple rewrites explicitly.
- `simp [h1, h2]`: simplification with bounded context.
- Avoid global `simp` sets when proof stability matters.

## Search / automation
- `exact?`: suggest a direct term.
- `aesop?`: useful for structural propositional goals.
- `omega`, `linarith`, `ring`, `norm_num`: use only in matching arithmetic domains.

## Common anti-patterns
- Overusing `simp` without an explicit lemma list.
- Long fragile chains of `first | ...` and backtracking combinators.
- Leaving exploratory commands (`admit`, `sorry`, `aesop?`) in final output.
- Solving too much at once instead of introducing helper lemmas.

## Recovery checklist for failures
1. Inspect goal and local context.
2. Identify missing rewrite/lemma direction.
3. Add explicit type annotations for ambiguous terms.
4. Split into helper lemma if the goal mixes multiple concepts.
5. Re-run Lean check after each significant adjustment.
