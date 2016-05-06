import { Component } from '@angular/core';

@Component({
  selector: 'my-app',
  templateUrl:'./app/books.component.html',
})
export class AppComponent {
  books = BOOKS;
}

export class Book {
  id: number;
  title: string;
  author: string;
}

var BOOKS: Book[] = [
  { "id": 11, "title":  "Mr. Nice" },
  { "id": 12, "title": "Narco" },
  { "id": 13, "title": "Bombasto" },
  { "id": 14, "title": "Celeritas" },
  { "id": 15, "title": "Magneta" },
  { "id": 16, "title": "RubberMan" },
  { "id": 17, "title": "Dynama" },
  { "id": 18, "title": "Dr IQ" },
  { "id": 19, "title": "Magma" },
  { "id": 20, "title": "Tornado" }
];
