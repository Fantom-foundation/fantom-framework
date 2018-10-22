# fantom-framework

We describe Fantom, a framework for asynchronous distributed systems. Fantom is based on the
Lachesis Protocol [1], which uses asynchronous event transmission for practical Byzantine fault
tolerance (pBFT) to create a leaderless, scalable, asynchronous Directed Acyclic Graph (DAG).
We further optimize the Lachesis Protocol by introducing a permission-less network for dynamic
participation. Root selection cost is further optimized by the introduction of an n-row flag table, as
well as optimizing path selection by introducing domination relationships.
We propose an alternative framework for distributed ledgers, based on asynchronous partially ordered
sets with logical time ordering instead of blockchains.
This paper builds upon the original proposed family of Lachesis-class consensus protocols. We
formalize our proofs into a model that can be applied to abstract asynchronous distributed system.
