# Public Release Checklist

## Home repository

- [x] Project-home repository is separate from the three implementation repositories.
- [x] No source duplication or Git submodules are used.
- [x] `scripts/clone-all.sh` provides optional multi-repository checkout convenience.
- [x] `manifest.yaml` pins exact reviewed component commits.
- [x] README includes a tagline, four restrained badges, system overview, setup order, security model, and documentation index.
- [x] High-resolution vector hero and technical architecture visuals were rendered and visually inspected for overlap, clipping, hierarchy, and flow before commit.

## Public-project files

- [x] LICENSE and NOTICE are present.
- [x] CONTRIBUTING.md and SECURITY.md are present.
- [x] Setup, requirements, architecture, hardware, wiring, development, releases, troubleshooting, prompting, and release-checklist docs are present.

## Privacy and accuracy

- [x] Home repository contains no credentials, real deployment endpoints, personal email addresses, identifying user paths, MAC addresses, GPS/location data, private hostnames, or runtime configuration.
- [x] Examples use placeholders such as `<host>`.
- [x] Hardware claims are grounded in the sanitized firmware/control repositories.
- [x] Unknown motor, power, mechanics, storage, OS-version, and generalized minimum requirements remain explicitly unknown.
- [x] Security text states that the current control API is unauthenticated and intended for a trusted local network.

## Component release coordination

- [x] `ScanBot3000-firmware` main is a single parentless `Initial public release` commit.
- [x] `ScanBot3000-control` main is a single parentless `Initial public release` commit.
- [x] `ScanBot3000-kinematics` main is a single parentless `Initial public release` commit.
- [x] All three component repositories had only `main` during the branch audit.
- [x] Available tag-reference checks returned no tag namespace for the component repositories during sanitization.
- [x] Repository visibility was not changed as part of sanitization.

## Known follow-up

- [ ] Physically revalidate the firmware's sanitized VL6180X PlatformIO dependency on the R-axis hardware before treating the public baseline as production-qualified.

## Final Git state

- [x] This home repository's retained `main` is rewritten to one parentless `Initial public release` commit containing the complete public-ready tree.
