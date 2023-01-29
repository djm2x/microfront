import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppComponent } from './app/app.component';
import { bootstrapApplication } from '@angular/platform-browser';
import { enableProdMode, importProvidersFrom } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { environment } from './environments/environment';
import { HOME_ROUTES } from './app/app.routes';


if (environment.production) {
  enableProdMode();
}
// platformBrowserDynamic().bootstrapModule(AppComponent)
//   .catch(err => console.error(err));

console.warn('home app')
bootstrapApplication(AppComponent
//   , {
//   providers: [
//     importProvidersFrom(RouterModule.forRoot(HOME_ROUTES))
//   ]
// }
);
