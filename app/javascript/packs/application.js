// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";
import "controllers";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
/* import {handleForm} from "../form/form.js" */
import {autocompleteSearch} from "../components/autocomplete"

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  /* handleForm() */
  autocompleteSearch()
});

