package repositories

import (
    "database/sql"
    "mcs_bab_6/entities"
)

func GetCards(db *sql.DB) (result []entities.Card, err error) {
    sqlQuery := "SELECT * FROM card"
    rows, err := db.Query(sqlQuery)
    if err != nil {
        return
    }
    defer rows.Close()

    for rows.Next() {
        var data entities.Card

        err = rows.Scan(&data.ID)
        if err != nil {
            return
        }

        result = append(result, data)
    }

    return
}

func InsertCard(db *sql.DB, card entities.Card) (err error) {
    sqlQuery := "INSERT INTO card(id) VALUES($1)"
    _, err = db.Exec(sqlQuery, card.ID)
    return
}

func DeleteCard(db *sql.DB, card entities.Card) (err error) {
    sqlQuery := "DELETE FROM card WHERE id = $1"
    _, err = db.Exec(sqlQuery, card.ID)
    return
}
