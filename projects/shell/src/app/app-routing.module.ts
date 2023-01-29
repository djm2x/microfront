import { loadRemoteModule } from '@angular-architects/module-federation';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { environment } from '../environments/environment';

const routes: Routes = [
  // {
  //   path: 'flight',
  //   loadChildren: () => import('remoteApp/Module')
  //     .then(m => m.FlightModule)
  // },
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  // { path: 'flight', loadChildren: () => loadRemoteModule({type: 'manifest',remoteName: 'remoteApp',exposedModule: './Module' }).then(m => m.FlightModule) },
  // { path: 'product', loadChildren: () => loadRemoteModule({type: 'manifest',remoteName: 'product',exposedModule: './Module' }).then(m => m.AppModule) },
  // { path: 'home', loadComponent: () => loadRemoteModule({type: 'manifest',remoteName: 'home',exposedModule: './Component' }).then(m => m.AppComponent) },

  { path: 'flight', loadComponent: () => loadRemoteModule({type: 'module',remoteEntry: `${environment.remoteApp}/remoteEntry.js`,exposedModule: './Module' }).then(m => m.FlightModule) },
  { path: 'product', loadComponent: () => loadRemoteModule({type: 'module',remoteEntry: `${environment.product}/remoteEntry.js`,exposedModule: './Module' }).then(m => m.AppModule) },
  { path: 'home', loadComponent: () => loadRemoteModule({type: 'module',remoteEntry: `${environment.home}/remoteEntry.js`,exposedModule: './Component' }).then(m => m.AppComponent) },


  // {
  //   path: '**',
  //   component: NotFoundComponent
  // }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
