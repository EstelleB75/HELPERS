import Isotope from 'isotope-layout'
let queryRegexp;

const filter = (itemElem) => queryRegexp ? itemElem.textContent.match(queryRegexp) : true


const arrangeItems = (iso) => {
    const quicksearchField = document.querySelector('.quicksearch');
    
    queryRegexp = new RegExp( quicksearchField.value, 'gi' );
    iso.layout();
    iso.arrange();
}

const filterFns = {
  categories: function( itemElem ) {
    const subcat = itemElem.querySelector('').innerText;
    ;
  }
};



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

  const filtersElem = document.querySelector('.subcats');
  filtersElem.addEventListener( 'click', ( event ) => {  
    const filterValue = event.target.getAttribute('data-cat');
    filterValue = filterFns[ filterValue ] || filterValue;
    iso.arrange({ filter: filterValue });
  });
}

export { isotopeInit };
