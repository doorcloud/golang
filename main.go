package main

import (
    "fmt"
    "net/http"
	"github.com/sirupsen/logrus" // Example package

)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, World!")
	logrus.Info("Hello, World!")

}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":5000", nil)
}
