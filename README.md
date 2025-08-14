# Panini LLVM IR Files

This repository contains the LLVM IR (`.ll`) files generated from the C source files of the parsers included in the **Panini** repository.

## Notes
- The `.ll` files were generated using the C files from the Panini parsers.
- Two files produced **errors** during LLVM IR generation and are **not included**:
  - `203.c`
  - `372.c`
- Two files produced **warnings** during LLVM IR generation but were generated and **are included**:
  - `094.c`
  - `cgidecode.c`
