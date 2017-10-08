$(document).ready(() => {
  // carousel for chicago
  let slidesChicago = $(".chicagoPerformers");
  let slideCountChicago = slidesChicago.length;
  let slideIndexChicago = 1;

  $(slidesChicago[0]).fadeIn(800, () => {
    $(slidesChicago[0]).delay(2400).fadeOut(800)
  })

  setInterval(() => {
    let activeIndex = slideIndexChicago % slideCountChicago;
    for (i = 0; i < slidesChicago.length; i++) {
      $(slidesChicago[i]).css("display", "none");
    }

    $(slidesChicago[activeIndex]).fadeIn(800, () => {
      $(slidesChicago[activeIndex]).delay(2400).fadeOut(800)
    })

    slideIndexChicago++;
  }, 4000);

  // carousel for minneapolis
  let slidesMinneapolis = $(".minneapolisPerformers");
  let slideCountMinneapolis = slidesMinneapolis.length;
  let slideIndexMinneapolis = 1;

  $(slidesMinneapolis[0]).fadeIn(800, () => {
    $(slidesMinneapolis[0]).fadeOut(800)
  })

  setInterval(() => {
    let activeIndex = slideIndexMinneapolis % slideCountMinneapolis;
    for (i = 0; i < slidesMinneapolis.length; i++) {
      $(slidesMinneapolis[i]).css("display", "none");
    }

    $(slidesMinneapolis[activeIndex]).fadeIn(800, () => {
      $(slidesMinneapolis[activeIndex]).delay(2400).fadeOut(800)
    })

    slideIndexMinneapolis++;
  }, 4000);
})
