import mysql from "mysql2/promise";

const required = ["CIATA_DS_DB_HOST", "CIATA_DS_DB_NAME", "CIATA_DS_DB_USER", "CIATA_DS_DB_PASSWORD"];

export function databaseConfigured() {
  return required.every((name) => Boolean(process.env[name]));
}

let pool;

export function getDatabasePool() {
  if (!databaseConfigured()) {
    throw new Error("Banco CIATA-DS nao configurado no ambiente do servidor.");
  }

  if (!pool) {
    pool = mysql.createPool({
      host: process.env.CIATA_DS_DB_HOST,
      port: Number(process.env.CIATA_DS_DB_PORT || 3306),
      database: process.env.CIATA_DS_DB_NAME,
      user: process.env.CIATA_DS_DB_USER,
      password: process.env.CIATA_DS_DB_PASSWORD,
      charset: "utf8mb4",
      waitForConnections: true,
      connectionLimit: Number(process.env.CIATA_DS_DB_POOL_SIZE || 5),
      queueLimit: 0,
      enableKeepAlive: true,
      keepAliveInitialDelay: 0,
    });
  }

  return pool;
}

export async function checkDatabase() {
  const db = getDatabasePool();
  const [rows] = await db.query(
    "SELECT DATABASE() AS database_name, CURRENT_USER() AS database_user, VERSION() AS database_version"
  );
  return rows[0];
}
