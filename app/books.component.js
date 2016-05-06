"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var AppComponent = (function () {
    function AppComponent() {
        this.books = BOOKS;
    }
    AppComponent = __decorate([
        core_1.Component({
            selector: 'my-app',
            templateUrl: './app/books.component.html',
        }), 
        __metadata('design:paramtypes', [])
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
var Book = (function () {
    function Book() {
    }
    return Book;
}());
exports.Book = Book;
var BOOKS = [
    { "id": 11, "title": "Mr. Nice" },
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
//# sourceMappingURL=books.component.js.map