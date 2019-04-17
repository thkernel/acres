document.addEventListener('turbolinks:load', event => {
    if (typeof gtag === 'function') {
      gtag('config', 'UA-1183577-19', {
        'page_location': event.data.url
      });
    }
  });