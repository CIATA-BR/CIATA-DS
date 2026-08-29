import fs from "node:fs/promises";

const source = new URL("../acessibilidade/wcag-2.2/criterios.json", import.meta.url);
const data = JSON.parse(await fs.readFile(source, "utf8"));
const errors = [];

const expectedNew = new Set(["2.4.11", "2.5.7", "2.5.8", "3.2.6", "3.3.7", "3.3.8"]);
const allowedLevels = new Set(["A", "AA"]);
const allowedStatus = new Set(["active", "historical-removed"]);
const requiredText = ["code", "title", "principle", "guideline", "level", "introducedIn", "status", "ciataRule", "affectedAssistiveBehavior", "failureExamples", "ciataNotes", "officialSource"];

if (data.standard !== "WCAG" || data.version !== "2.2") errors.push("A base deve identificar WCAG 2.2.");
if (data.language !== "pt-BR") errors.push("O idioma canônico deve ser pt-BR.");
if (!Array.isArray(data.criteria)) errors.push("criteria deve ser uma lista.");

const criteria = Array.isArray(data.criteria) ? data.criteria : [];
const seen = new Set();

for (const criterion of criteria) {
  for (const field of requiredText) {
    if (typeof criterion[field] !== "string" || !criterion[field].trim()) {
      errors.push(`${criterion.code || "Critério sem código"}: campo obrigatório ausente: ${field}.`);
    }
  }
  if (seen.has(criterion.code)) errors.push(`Código duplicado: ${criterion.code}.`);
  seen.add(criterion.code);
  if (!allowedLevels.has(criterion.level)) errors.push(`${criterion.code}: nível inválido: ${criterion.level}.`);
  if (!allowedStatus.has(criterion.status)) errors.push(`${criterion.code}: estado inválido: ${criterion.status}.`);
  if (!criterion.officialSource?.startsWith("https://www.w3.org/")) errors.push(`${criterion.code}: fonte oficial não pertence ao W3C.`);
  if (!Array.isArray(criterion.components) || criterion.components.length === 0) errors.push(`${criterion.code}: componentes ausentes.`);
  if (!Array.isArray(criterion.priorityInterfaces) || criterion.priorityInterfaces.length === 0) errors.push(`${criterion.code}: interfaces prioritárias ausentes.`);
  if (!criterion.manualTest?.procedure || !criterion.manualTest?.expectedResult) errors.push(`${criterion.code}: teste manual incompleto.`);
  if (!Array.isArray(criterion.manualTest?.technologies) || criterion.manualTest.technologies.length === 0) errors.push(`${criterion.code}: tecnologias de teste ausentes.`);
}

const active = criteria.filter((criterion) => criterion.status === "active");
const historical = criteria.filter((criterion) => criterion.status === "historical-removed");
const levelA = active.filter((criterion) => criterion.level === "A");
const levelAA = active.filter((criterion) => criterion.level === "AA");
const newIn22 = active.filter((criterion) => criterion.introducedIn === "WCAG 2.2");

if (criteria.length !== 56) errors.push(`Esperados 56 registros totais; encontrados ${criteria.length}.`);
if (active.length !== 55) errors.push(`Esperados 55 critérios ativos; encontrados ${active.length}.`);
if (levelA.length !== 31) errors.push(`Esperados 31 critérios A ativos; encontrados ${levelA.length}.`);
if (levelAA.length !== 24) errors.push(`Esperados 24 critérios AA ativos; encontrados ${levelAA.length}.`);
if (historical.length !== 1 || historical[0]?.code !== "4.1.1") errors.push("O único registro histórico removido deve ser 4.1.1.");
if (newIn22.length !== expectedNew.size) errors.push(`Esperados ${expectedNew.size} critérios A/AA novos; encontrados ${newIn22.length}.`);
for (const code of expectedNew) if (!newIn22.some((criterion) => criterion.code === code)) errors.push(`Critério novo ausente: ${code}.`);

if (errors.length) {
  console.error("Base WCAG 2.2 inválida:");
  for (const error of errors) console.error(`- ${error}`);
  process.exit(1);
}

console.log(`Base WCAG 2.2 válida: ${active.length} ativos (${levelA.length} A e ${levelAA.length} AA), ${newIn22.length} novos e ${historical.length} histórico.`);
