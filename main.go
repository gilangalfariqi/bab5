package main
import (
"database/sql"
"fmt"
"log"
"mcs_bab_6/database"
  "mcs_bab_6/routers"
_ "github.com/lib/pq"
)
const (
host = "localhost"
port = 5432
user = "postgres"
password = "" // SESUAIKAN DENGAN PASSWORD
POSTGRE YANG TELAH DIDAFTARKAN
dbName = "praktikum_mcs_bab_6" // SESUAIKAN DENGAN NAMA
DATABASE YANG DIBUAT
)
var (
DB *sql.DB
err error
)
func main() {
var PORT = ":8080"
psqlInfo := fmt.Sprintf(
`host=%s port=%d user=%s password=%s dbname=%s

sslmode=disable`,

host, port, user, password, dbName,
)
DB, err = sql.Open("postgres", psqlInfo)
if err != nil {
log.Fatalf("Error Open DB: %v\n", err)
}
database.DBMigrate(DB)
defer DB.Close()
routers.StartServer().Run(PORT)
fmt.Printf("Success Connected")
}
