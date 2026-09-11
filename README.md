[![Logo for Axiom Math](logo.svg)](https://axiommath.ai/)

# On the paucity of lattice triangles

These files accompany the paper [arXiv:2603.23928](https://arxiv.org/abs/2603.23928).

## Input files

- [`.environment`](input/.environment): lean version
- [`task.md`](input/task.md): description of the task to be completed
- [`problem.tex`](input/problem.tex): informal problem statement
- [`informal_proof.tex`](input/informal_proof.tex): draft of the proof by K.O. (which contained some
  correctable mistakes)

## Output files (Run with Lean 4.34.0-rc2)

- [`LatticeTriangle/problem.lean`](LatticeTriangle/problem.lean): translation of the problem statement into formal language (Lean)
- [`LatticeTriangle/solution.lean`](LatticeTriangle/solution.lean): solution in formal language (Lean)

## Verifying with Comparator

This repository can be verified against the formal problem statement with the Lean comparator on a Linux machine. First, follow the instructions in [https://github.com/leanprover/comparator](https://github.com/leanprover/comparator) to install comparator. Then, run the following command:

```
lake env comparator comparator.json
```

## License

This repository uses the MIT License. See [LICENSE](LICENSE) for details.

## Repository maintainers

- [Evan Chen](https://github.com/vEnhance)
- [Kenny Lau](https://github.com/kckennylau)
- [Ken Ono](https://github.com/kenono691)
- [Jujian Zhang](https://github.com/jjaassoonn)
