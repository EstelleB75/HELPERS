import Isotope from 'isotope-layout'

const isotopeInit = () => {
    let qsRegex
    // init Isotope
    const grid = document.querySelector('.grid')
    const iso = new Isotope( grid, {
      itemSelector: '.element-item',
      layoutMode: 'fitRows',
      filter: function() {
        return qsRegex ? $(this).text().match( qsRegex ) : true;
      }
    });
    
    // use value of search field to filter
    const quicksearchField = document.querySelector('.quicksearch')
    const quicksearch = quicksearchField.addEventListener('keyup', () => {
        qsRegex = new RegExp( quicksearchField.value, 'gi' );
        iso.arrange({
            filter: quicksearchField.value
        })
    });

    
    // debounce so filtering doesn't happen every millisecond
    function debounce( fn, threshold ) {
      var timeout;
      threshold = threshold || 100;
      return function debounced() {
        clearTimeout( timeout );
        var args = arguments;
        var _this = this;
        function delayed() {
          fn.apply( _this, args );
        }
        timeout = setTimeout( delayed, threshold );
      };
    }
}

export {
    isotopeInit
};

