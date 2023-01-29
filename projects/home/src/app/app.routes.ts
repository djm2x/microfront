import { Routes } from '@angular/router';
import { MenuComponent } from './menu/menu.component';

export const HOME_ROUTES: Routes = [
    {
        path: '',
        component: MenuComponent,
        // pathMatch: 'full'
    },
];
