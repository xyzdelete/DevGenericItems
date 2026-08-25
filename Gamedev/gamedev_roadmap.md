# Roadmap: Math for Game Dev on UE5

C++ is removed from this list — you already know it. This is only about the math you actually need for Unreal Engine 5 + Tom Looman's courses.

## Priority legend

- 🔴 **Must do** — without this you will get stuck in Looman's courses
- 🟡 **Useful, not critical** — speeds things up, can wait
- 🟢 **For later / reference** — not needed now, useful if you change direction or go deeper

---

## 🔴 Fletcher Dunn & Ian Parberry — *3D Math Primer for Graphics and Game Development*

2nd ed., 2011 (no 3rd edition exists) — the whole book is free at **gamemath.com**

The only truly required book here. Don't read it cover to cover before starting Unreal. Read it **in stages, alongside Looman's courses** — open the relevant chapter the moment you hit that math operation in code.

**How to line it up with Looman's courses:**

| Stage in Looman's course | What comes up | Fletcher chapters |
|---|---|---|
| Very start (before any tutorial) | Basic vector intuition | **Ch. 2-3** — vectors, dot product, cross product, projections. Read these first, day-one basics |
| Character Movement, Camera basics | `FVector::Normalize`, `DotProduct`, `GetActorForwardVector` | Same ch. 2-3, but now in code context — reread as you use them |
| Rotation systems, Camera lag, Aim Offset, IK | `FRotator` vs `FQuat`, gimbal lock | **Ch. 7-9** — rotation matrices, quaternions, Euler angles. The most valuable part of the book for UE5: explains why `FRotator` breaks and `FQuat` doesn't |
| Line Traces, Collision, physics (Chaos) | Local vs world space, transforms | Chapters on **coordinate systems and transforms** (roughly mid-book) |
| Procedural animation, splines, custom IK (if you get there) | Interpolation, curves | Final chapters — parametric curves. Not needed at the start |

---

## 🟡 3Blue1Brown — *"Essence of Linear Algebra"* playlist (YouTube)

Free, ~2-3 hours total. Best watched **before or alongside Fletcher's ch. 2-3** — gives visual intuition (what a basis is, what a linear transform does, what a determinant means) so Fletcher's formulas click faster. Not a replacement for the book, just a warm-up.

---

## 🟡 Jason Gregory — *Game Engine Architecture*

**3rd ed., 2018** (author is a tech director at Naughty Dog, no newer edition exists)

Not about math — about how an engine works internally: game loop, render pipeline, memory, physics. Useful once you want to understand **what** Unreal is doing under the hood instead of just using the API. Can wait until Looman's courses start to feel like "magic" — this book explains the mechanics behind it.

---

## 🟡 Ian Millington — *Game Physics Engine Development*

2nd ed., 2010

Only needed if you want to dig into collisions/rigid body **deeper** than built-in Chaos — e.g. writing your own physics or understanding why Chaos behaves the way it does. Not a priority while you're using the engine's physics system.

---

## 🟢 Kept "just in case" (not for now, might be useful later)

| Book | Author | Edition | When it might be useful |
|---|---|---|---|
| *How to Prove It* | Daniel Velleman | 3rd ed., 2019 | If you get into something that needs formal proofs — procedural generation with mathematical guarantees, algorithms with non-trivial complexity analysis, or just want to sharpen logical thinking outside of games |
| *Linear Algebra Done Right* | Sheldon Axler | **4th ed., 2024**, Springer (free Open Access PDF) | Not for game dev directly — pure vector space theory with little geometric intuition (it even avoids determinants in the usual sense). Useful if you move toward writing your own numerical algorithms, research-level computer graphics, or ML/simulation work on top of UE5 |
| *Understanding Analysis* | Stephen Abbott | 2nd ed., 2015, Springer | Rigorous real analysis (limits, continuity, series, with proofs). Almost never needed for game dev — relevant only if you go into high-precision physical simulation or want to read graphics/physics research papers in the original |
| *Contemporary Abstract Algebra* | Joseph Gallian | 10th ed., 2021, Chapman & Hall/CRC | Groups, rings, fields. Shows up in practice mostly in cryptography (netcode, anti-cheat) or procedural generation based on group theory. Low priority, more of a general math education thing |

---

## Action plan

1. Watch 3Blue1Brown "Essence of Linear Algebra" (a couple of evenings)
2. Read Fletcher ch. 2-3 (vectors) before starting practice
3. Start Looman's courses, keep the Fletcher book handy as a reference — read the relevant chapters as quaternions/transforms/collisions show up in code
4. Gregory and Millington — optional, whenever you want to understand "what's under the hood"
5. Velleman / Axler / Abbott / Gallian — not now, only if a specific task actually needs them
