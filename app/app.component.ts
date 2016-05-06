import { Component } from '@angular/core';

@Component({
  selector: 'my-app',
  template:`
    <h1>{{title}}</h1>
    <h2>My Heroes</h2>
    <ul class="books">
      <li *ngFor="let hero of books"
        [class.selected]="hero === selectedHero"
        (click)="onSelect(hero)">
        <span class="badge">{{hero.id}}</span> {{hero.title}}
      </li>
    </ul>
    <div *ngIf="selectedHero">
      <h2>{{selectedHero.name}} details!</h2>
      <div><label>id: </label>{{selectedHero.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="selectedHero.name" placeholder="name"/>
      </div>
    </div>
  `,
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
