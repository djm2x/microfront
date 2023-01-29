import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  standalone: true,
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  imports: [
    CommonModule,
    RouterModule,
  ]
})
export class AppComponent {
  static _index = 1;
  index = 1;
  title = 'home';

  constructor() {
    this.index = AppComponent._index
    AppComponent._index++;
  }
}
