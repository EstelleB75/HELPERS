import Isotope from 'isotope-layout'
let queryRegexp;

const filter = (itemElem) => queryRegexp ? itemElem.textContent.match(queryRegexp) : true


const arrangeItems = (iso) => {
    const quicksearchField = document.querySelector('.quicksearch');
    
    queryRegexp = new RegExp( quicksearchField.value, 'gi' );
    iso.layout();
    iso.arrange();
}

const isotopeInit = () => {
    const grid = document.querySelector('.iso-grid');
    if (!grid) return;

    const iso = new Isotope( grid, {
      itemSelector: '.element-item',
      layoutMode: 'fitRows',
      filter: filter
    });
    
    const quicksearchField = document.querySelector('.quicksearch');
    quicksearchField.addEventListener('keyup', () => { arrangeItems(iso) });
}

export { isotopeInit };
