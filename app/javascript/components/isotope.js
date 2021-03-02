import Isotope from 'isotope-layout'
import item from 'isotope-layout/js/item';
let queryRegexp;
let filterValue;

const filter = (itemElem) => queryRegexp ? itemElem.textContent.match(queryRegexp) : true

const filterCat = (itemElem) => filterValue ? JSON.parse(itemElem.dataset.cat).includes(filterValue) : true

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

  const filtersElem = document.querySelector('.subcats');
  filtersElem.addEventListener( 'click', ( event ) => {  
    filterValue = event.target.innerText.replace('&', '\\&');
    console.log(filterValue);

    iso.arrange({ filter: filterCat });
  });
}

export { isotopeInit };
