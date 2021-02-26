import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  console.log('hello')
  const assos = JSON.parse(document.getElementById('search-data').dataset.assos)
  console.log(assos)
  const searchInput = document.getElementById('query');
  console.log(searchInput)

  if (assos && searchInput) {
    console.log('init')
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = assos;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
