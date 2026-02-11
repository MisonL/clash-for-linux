# Update Kernel and Optimize Dependencies Plan

This plan addresses the two points requested by the boss:
1.  **Update Clash Kernel to Mihomo**: Change the download source to MetaCubeX/mihomo for better feature support.
2.  **Address Python3 Dependency**: Ensure the system has python3 for terminal width calculations in `install.sh` or provide a friendly warning.

## Proposed Changes

### [Kernel Management]

#### [MODIFY] [resolve_clash.sh](file:///mnt/d/code/clash-for-linux/scripts/resolve_clash.sh)
- Update `CLASH_DOWNLOAD_URL_TEMPLATE` to: `https://github.com/MetaCubeX/mihomo/releases/download/{version}/mihomo-linux-{arch}-{version}.gz`.
- Update `download_clash_bin` to:
    - Use `gh release view` or `curl` on GitHub API to fetch the latest version tag.
    - Appropriately substitute `{version}` and `{arch}` in the template.
    - Note: Mihomo filenames include 'v' in version tag (e.g. `v1.19.20`), but the asset name is `mihomo-linux-amd64-v1.19.20.gz`.

### [Dependency Management]

#### [MODIFY] [install.sh](file:///mnt/d/code/clash-for-linux/install.sh)
- Add a pre-check for `python3` at the beginning of the script.
- If `python3` is missing, print a friendly warning and explain that terminal width calculations might not be perfect, or offer to install it via `apt` (if on Ubuntu/Debian).

## Verification Plan

### Automated Tests
- Run the updated `resolve_clash.sh` to download the latest Mihomo binary.
- Verify binary version: `sudo ./bin/mihomo-linux-amd64 -v`.
- Run `install.sh` and observe the dependency check.
