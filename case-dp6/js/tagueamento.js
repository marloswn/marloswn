// Implementa a analytics
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-12345-6', 'auto');
ga('send', 'pageview');

// Funcções para disparar eventos
const handleClickEventContact = event => {
  ga('send', 'event', {
    eventCategory: 'menu',
    eventAction: 'entre_em_contato',
    eventLabel: 'link_externo'
  });
}

const handleClickEventPDF = event => {
  ga('send', 'event', {
    eventCategory: 'menu',
    eventAction: 'download_pdf',
    eventLabel: 'download_pdf'
  });
}

const handleClickEventLorem = event => {
  ga('send', 'event', {
    eventCategory: 'analise',
    eventAction: 'ver_mais',
    eventLabel: 'lorem'
  });
}

const handleClickEventIpsum = event => {
  ga('send', 'event', {
    eventCategory: 'analise',
    eventAction: 'ver_mais',
    eventLabel: 'ipsum'
  });
}

const handleClickEventDolor = event => {
  ga('send', 'event', {
    eventCategory: 'analise',
    eventAction: 'ver_mais',
    eventLabel: 'dolor'
  });
}

const handleClickEventPopup = event => {
  ga('send', 'event', {
    eventCategory: 'contato',
    eventAction: 'enviado',
    eventLabel: 'enviado'
  });
}

// Captura os IDs dos elementos pertinentes ao case
const contact = document.getElementById("entrar-contato");
const pdf = document.getElementById("download-pdf");
const lorem = document.getElementById("card-lorem");
const ipsum = document.getElementById("card-ipsum");
const dolor = document.getElementById("card-dolor");
const name = document.getElementById("form-field-name");
const email = document.getElementById("email");
const telefone = document.getElementById("telefone");
const aceito = document.getElementById("aceito");
const popup = document.getElementById("popup");

// Captura os clicks dos elementos
contact.onclick = handleClickEventContact;
pdf.onclick = handleClickEventPDF;
lorem.onclick = handleClickEventLorem;
ipsum.onclick = handleClickEventIpsum;
dolor.onclick = handleClickEventDolor;
popup.onclick = handleClickEventPopup;

/* Verifica se os campos do formulário de contato da página Sobre.html foram preenchidos. 
Se sim, dispara um evento. Se não, mostra uma mensagem solicitando o preenchimento.*/

function fieldsValidation(){
  if (name.value){
    console.dir(name.value);
  	ga('send', 'event', {
      eventCategory: 'contato',
      eventAction: 'nome',
      eventLabel: 'preencheu'
    });
  }

  if (email.value){
    console.dir(email.value);
  	ga('send', 'event', {
      eventCategory: 'contato',
      eventAction: 'email',
      eventLabel: 'preencheu'
    });
  }

  if (telefone.value){
    console.dir(telefone.value);
  	ga('send', 'event', {
      eventCategory: 'contato',
      eventAction: 'telefone',
      eventLabel: 'preencheu'
    });
  }

  if (aceito.value){
    console.dir(aceito.value);
  	ga('send', 'event', {
      eventCategory: 'contato',
      eventAction: 'aceito',
      eventLabel: 'preencheu'
    });
  }
}

// Preencha este arquivo com qualquer código que você necessite para realizar a
// coleta, desde a biblioteca analytics.js, gtag.js ou o snippet do Google Tag 
// Manager. No último caso, não é necessário implementar a tag <noscript>.
// O ambiente dispõe da jQuery 3.5.1, então caso deseje, poderá utilizá-la
// para fazer a sua coleta.
// Caso tenha alguma dúvida sobre o case, não hesite em entrar em contato.