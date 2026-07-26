// Fixed single brand theme — the light/dark toggle has been removed.
// Kept as a function (not inlined at call sites) because giscus.liquid,
// no_defer.js, common.js, and the echarts/vega/mermaid/diff2html includes
// all call determineComputedTheme() by name.
let determineComputedTheme = () => "light";
