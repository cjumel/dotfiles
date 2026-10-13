# Instructions

## Moving, Renaming and Deleting Files

When moving, renaming, or deleting a file, use the corresponding `apply_patch` operation instead of
manually reproducing the result through content edits.

- To move or rename a file, use `apply_patch` with `Move to`, including any content changes in the
  same patch when practical.
- To delete a file, use `apply_patch` with `Delete File`.

After moving or renaming a file, search for and update affected imports, references, configuration,
and other paths.
