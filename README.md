# CUE AWS IAM Policy Exploration

> [!WARNING]
> Abandoned repository as part of a series of generic explorations in Cuelang capabilities.

Models a constrained subset of identity-based S3 IAM policies in CUE, including composition and JSON export.

```sh
cue export ./examples/valid:readonly
cue export ./examples/valid:composed
cue vet ./examples/invalid:unknownaction
cue vet ./examples/invalid:actionresourcemismatch
cue vet ./examples/invalid:wrongeffect
cue vet ./examples/invalid:composed
```

## Notes

- Closed definitions reject fields outside the selected policy profile.
- Discriminated statement shapes bind S3 actions to compatible bucket or object ARNs.
- CUE unification lets an overlay narrow a reusable fragment without widening its permissions.
- Invalid examples demonstrate unknown actions, mismatched resources, disallowed effects, and conflicting overlays.
- Think this is very interesting, as a way of constructing things. Although is cuelang the right way for it?
- Can we incorporate this into C# Roslyn source generation?
