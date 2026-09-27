# Security Notes

## Dependency audit status

The initial workspace uses stable Next.js. On 2026-05-15, `npm audit --omit=dev`
reported a moderate PostCSS advisory through Next.js:

- package path: `next > postcss`
- installed Next stable: `15.5.18`
- latest Next stable checked through npm: `16.2.6`
- latest stable still declares `postcss 8.4.31`
- `next@canary` declares a patched `postcss 8.5.10`, but canary is not adopted
  without explicit validation.

Decision:

- keep stable Next.js for the foundation;
- do not run `npm audit fix --force`, because npm proposes a breaking downgrade;
- force Next's transitive PostCSS resolution to `8.5.14` through npm `overrides`
  and the committed lockfile.

Current validation:

- `npm install --ignore-scripts` keeps the override resolution;
- `npm ls postcss` resolves Next to `postcss 8.5.14`;
- `npm audit --omit=dev` reports `0 vulnerabilities`.

No production release is allowed while a production dependency audit has unresolved
vulnerabilities unless the exception is explicitly validated and documented.
