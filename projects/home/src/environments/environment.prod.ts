
// const URL = 'http://vmi633563.contaboserver.net:5005'
const URL_PROD = `https://core-api.centralium.site`;
const URL_API_JOB = `https://jobs.centralium.site`;

// const URL_API_JOB = `http://65.109.65.236:5011`;
// const URL_PROD = `http://vmi633563.contaboserver.net:5005`;

export const environment = {
  production: true,
  apiUrl: `${URL_PROD}/api`,
  apiJobUrl: `${URL_API_JOB}/api`,
  url: URL_PROD,
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
