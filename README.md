# ZMK Module Collection

This repository is a proof of concept of a more official collection of modules as mentioned in [this PR](https://github.com/zmkfirmware/zmk/pull/2456).

The modules listed in this repository are **not** properly vetted, nor do they have any guarantees regarding things interacting nicely. 
They are also not bound to any particular version of ZMK. 

## Usage

To use this, add this module as a project to your `config/west.yml`:

```yaml
manifest:
  projects:
    - name: zmk-module-collection
      url: git@github.com:Nick-Munnich/zmk-module-collection.git
      revision: main
      import:
         name-allowlist: 
             - zmk-module-placeholder
```

Then you can add any modules you wish to include from this collection under the `name-allowlist` like so:

```yaml
manifest:
  projects:
    - name: zmk-module-collection
      url: git@github.com:Nick-Munnich/zmk-module-collection.git
      revision: main
      import:
         name-allowlist: 
             - zmk-keyboards-akohekohe
             - zmk-components-vik
             - zmk-behavior-tri-state
```

## Adding Additional Modules

Modules not listed in this collection can be added as usual. If you wish to add modules to this collection, you can either contact me about it, make an issue, or make a PR directly following the same format as existing modules.

# Module Rules (Draft)

To avoid overloading project maintainers, adding modules to this repo is primarily done via automation. In order to avoid bad or broken modules from being added, the checks done are intentionally quite restrictive.

## Module Types

Modules in this repo fall into three groups:

### Verified Modules

These modules pass both our automated tests and have been manually reviewed. Manual review is necessary to ensure that these modules 

1. Do not have any security concerns or contain any offensive/obscene material
2. Work as described
3. Have tests with suitable coverage in place

What is *not* checked as part of verification, but a verified module should ideally have is:

1. Well-styled code
2. Little to no overlap with other modules
3. Are structured to serve as excellent references for other modules
4. Are likely (reasonable level of confidence) to be maintained over the long-term

### Validated Modules

These modules pass all of our automated tests, and fall into one of these module categories:

- ZMK Keyboards

Our automated tests for these categories are restrictive enough and cover enough that we are reasonably confident in serving these modules to the public without manual verification.

### Experimental Modules

These modules pass a specific subset of our automated tests which check basic module functionality. Unlike the previous categories, these modules are *not* automatically made available to the public. Instead, users need to explicitly opt in to these modules. 

## Module Tooling & Tests

Different categories of modules have different tests applied to them.

### All Types

- A TODO test to verify that the remote `module/zephyr` manifest matches our conventions. 
- A TODO test to verify that a group of "testing" keyboards can be built when all modules are included.

### Keyboard Tests

- A TODO test to verify that the folder structure of the module (and corresponding remote manifest) follows [the common use case for the keyboard type](https://zmk.dev/docs/development/module-creation#predefined-files-and-folders). A keyboard module is not restricted to *only* having these folders, but if a keyboard module has e.g. a `src/` directory, then it must be manually verified and cannot be validated.
- A TODO test to verify that all included keyboards build when all modules are included.
- A TODO test to verify the remote .zmk.yml files for all included keyboards.
- A TODO test to verify that all included keyboards (included) have a .zmk.yml file pointing to them.
- A TODO test to verify that the remotely included keyboards only consist of shields.

### Other Types

Modules which do not contain keyboards or components have the following additional test applied to them:

- TODO Check that there is a `tests` directory with at least one test, and checks to make sure that all tests in said directory pass.

## Assorted Information

- Modules in this repo shall not use project-level manifests, where there is a west manifest located in the remote project and items are imported from it. Instead, they should always use local imports, where 