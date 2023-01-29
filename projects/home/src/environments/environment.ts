// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.
const URL_API_CORE = `http://localhost:5000`;
const URL_API_JOB = `http://localhost:5001`;
// const URL_PROD = `http://vmi633563.contaboserver.net:5005`;
const URL_PROD = `https://core-api.centralium.site`;
const URL_API_JOB_PROD = `http://65.109.65.236:5011`;

export const environment = {
    production: false,
    apiUrl: `${URL_API_CORE}/api`,
    apiJobUrl: `${URL_API_JOB_PROD}/api`,
    url: URL_API_CORE,
};


export function displayImage(urlImage: string) {
    const IMAGE = 'assets/404.jpg';

    if (!urlImage) {
        return IMAGE;
    }

    if (urlImage.startsWith('[') && urlImage.endsWith(']')) {
        try {
            const img: string = (JSON.parse(urlImage) as string[])[0];
            return `${environment.url}/${img}`;
        } catch (error) {
            return IMAGE;
        }
    }

    if (urlImage?.startsWith('http')) {
        return urlImage;
    }
    if (!urlImage.includes('/')) {
        return IMAGE;
    }

    if (urlImage.startsWith('data:')) {
        return urlImage;
    }

    return `${environment.url}/${urlImage}`;
}
/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
