---
name: lean-prover-openclaw
description: Lean 4 theorem-proving workflow for OpenClaw tasks, including translating requirements into formal statements, building proof skeletons, selecting tactics, debugging failing goals, and validating with lake/lean tooling. Use when asked to prove theorems, formalize specs, repair Lean proof errors, or produce proof-oriented Lean code for OpenClaw.
---

# Lean Prover for OpenClaw

## Overview
Use this skill to produce reliable Lean 4 proofs for OpenClaw by following a strict loop: formalize, scaffold, prove incrementally, and verify with tooling.

## Workflow
1. **Define the target precisely**
   - Restate the claim in Lean terms (types, assumptions, conclusion).
   - If the request is informal, convert it into one or more candidate theorem statements and pick the minimal one that satisfies the request.
2. **Create a proof skeleton first**
   - Write theorem signature and `by` block.
   - Use `have`, `suffices`, and intermediate lemmas to split hard goals.
   - Prefer short lemma chains over a single dense tactic block.
3. **Prove incrementally**
   - Start with `intro`/`rintro`, `cases`, `constructor`, `refine`, `exact?`, `aesop?` to discover structure.
   - Replace exploratory commands with explicit tactics/terms once stable.
   - Keep each step goal-directed; avoid broad `simp` unless constrained.
4. **Stabilize and simplify**
   - Replace brittle automation with explicit rewrite steps where possible.
   - Consolidate repeated proof patterns into local lemmas.
   - Ensure names reflect mathematical intent.
5. **Validate with tooling**
   - Run Lean checks (`lake env lean <file>` or `lake build`) after meaningful edits.
   - Resolve all errors/warnings before finalizing.

## Proof Strategy Decision Rules
- Use **term-style proofs** for short structural arguments.
- Use **tactic-style proofs** for case splits, rewrites, and search-heavy steps.
- Prefer `rw`/`simp [lemmas]` when rewriting is the core operation.
- Prefer `linarith`, `omega`, `ring`, `norm_num` only when domain assumptions fit and output remains understandable.
- If automation fails twice, introduce an intermediate lemma and continue from that lemma.

## Debugging Failing Proofs
- Read the current goal and local context before editing tactics.
- For type mismatch errors, align expected vs actual type with `change`, `show`, or explicit coercions.
- For rewrite failures, verify exact lemma orientation and required side conditions.
- For stuck metavariables, add type annotations to terms and `have` statements.
- For fragile `simp`, replace with targeted `simp [h1, h2]` and explicit `rw` steps.

## Output Expectations
- Provide compilable Lean code, not pseudocode.
- Include brief comments only for non-obvious proof pivots.
- Keep theorem names and lemma names consistent with OpenClaw naming conventions if provided in-project.

## References
- For reusable theorem/proof templates, read `references/proof-templates.md`.
- For tactic selection heuristics and anti-patterns, read `references/tactic-playbook.md`.
