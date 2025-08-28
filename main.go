package main

import (
	"fmt"
	"go-rest-api/handlers"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	// กำหนดเส้นทาง
	r.HandleFunc("/generate-token", handlers.GenerateToken).Methods("POST")
	r.HandleFunc("/books", handlers.GetBooks).Methods("GET")
	r.HandleFunc("/book/{id}", handlers.GetBook).Methods("GET")

	// รันเซิร์ฟเวอร์
	fmt.Println("Server is running on port 8000...")
	log.Fatal(http.ListenAndServe(":8000", r))
}
