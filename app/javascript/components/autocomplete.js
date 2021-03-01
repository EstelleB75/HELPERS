import autocomplete from 'js-autocomplete';

const autocompleteSearch = () => {
  const searchBar = document.getElementById('search-data')
    if (!searchBar) return;

  const data = searchBar.dataset.assos
  const assos = JSON.parse(data)

  const searchInput = document.getElementById('query');

  if (assos && searchInput) {
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
