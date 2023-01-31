# Mfe

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 15.1.1.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.


npm i @angular-architects/module-federation
https://angular.io/guide/file-structure

ng generate application product --routing --style=scss
ng generate application home
ng g lib shared-lib

https://github.com/angular-architects/module-federation-plugin/blob/main/libs/mf/tutorial/tutorial.md

ng add @angular-architects/module-federation --project shell --type dynamic-host --port 4200

ng add @angular-architects/module-federation --project remote-app --type remote --port 4201

ng add @angular-architects/module-federation --project product --type remote --port 4202

ng add @angular-architects/module-federation --project home --type remote --port 4203


deploy only if changed in angular monorepo

https://stackoverflow.com/questions/54654159/npm-publish-only-if-changed-in-angular-monorepo

#
https://engineering.brigad.co/only-deploy-services-impacted-by-changes-in-a-mono-repository-18f54b8ac109
monorepo deploy changes with git diff
