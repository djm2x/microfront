import { loadRemoteModule } from '@angular-architects/module-federation';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  // {
  //   path: 'flight',
  //   loadChildren: () => import('remoteApp/Module')
  //     .then(m => m.FlightModule)
  // },
  {
    path: 'flight',
    loadChildren: () =>
      loadRemoteModule({
        type: 'manifest',
        remoteName: 'remoteApp',
        exposedModule: './Module'
      })
        .then(m => m.FlightModule)
  },

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
