import Isotope from 'isotope-layout'
let queryRegexp;

const filter = (itemElem) => queryRegexp ? itemElem.textContent.match(queryRegexp) : true


const arrangeItems = (iso) => {
    const quicksearchField = document.querySelector('.quicksearch');
    
    queryRegexp = new RegExp( quicksearchField.value, 'gi' );
    iso.layout();
    iso.arrange();
}

var iso = new Isotope( '.grid', {
  itemSelector: '.element-item',
  layoutMode: 'fitRows'
});

// filter functions
var filterFns = {
  // show if number is greater than 50
  numberGreaterThan50: function( itemElem ) {
    var number = itemElem.querySelector('.number').textContent;
    return parseInt( number, 10 ) > 50;
  },
  // show if name ends with -ium
  ium: function( itemElem ) {
    var name = itemElem.querySelector('.name').textContent;
    return name.match( /ium$/ );
  }
};


const filtersElem = document.querySelector('.filters-button-group');
filtersElem.addEventListener( 'click', function( event ) {
  // only work with buttons
  if ( !matchesSelector( event.target, 'button' ) ) {
    return;
  }
  var filterValue = event.target.getAttribute('data-filter');
  // use matching filter function
  filterValue = filterFns[ filterValue ] || filterValue;
  iso.arrange({ filter: filterValue });
});

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
