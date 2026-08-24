# Release and Compatibility Model

ScanBot3000 components are independent repositories and do not need identical version numbers.

## Project release manifest

`manifest.yaml` records a reviewed combination of component commits. For the initial public baseline it pins one commit from firmware, control, and kinematics.

This provides two workflows:

- **Development:** use each repository's `main` branch.
- **Reproduction:** check out the exact commit recorded by a project release manifest.

## Initial public baseline

The component commits in the current manifest are each parentless `Initial public release` roots created after repository sanitization and documentation completion.

No tag is implied by the manifest. Tags/releases can be added later without forcing all component repositories onto one shared version number.

## Updating the manifest

Before changing a component commit:

1. Review the component's own release checklist.
2. Verify interface compatibility with the other two components.
3. Exercise the affected integration path on the relevant hardware where required.
4. Update system-level architecture/setup docs if behavior changed.
5. Record the new exact SHA.

A manifest is a compatibility record, not a safety certification.
