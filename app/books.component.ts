import { Component } from '@angular/core';

@Component({
  selector: 'my-app',
  templateUrl:'./app/books.component.html',
})
export class BooksComponent {
  selectedBook: Book;
  onSelect(book:Book) { this.selectedBook = book; }
  // exposes books for binding
  public books = BOOKS;
}

export class Book {
  id: number;
  title: string;
  author: string;
}

var BOOKS: Book[] = [
  { "id": 11, "title": "Mr. Nice", "author": "Me" },
  { "id": 12, "title": "Narco", "author": "Me" },
  { "id": 13, "title": "Bombasto", "author": "Me" },
  { "id": 14, "title": "Celeritas", "author": "Me" },
  { "id": 15, "title": "Magneta", "author": "Me" },
  { "id": 16, "title": "RubberMan", "author": "Me" },
  { "id": 17, "title": "Dynama", "author": "Me" },
  { "id": 18, "title": "Dr IQ", "author": "Me" },
  { "id": 19, "title": "Magma", "author": "Me" },
  { "id": 20, "title": "Tornado", "author": "Me"  }
];
