/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'
import 'bootstrap-select';
import "core-js/stable";
import "regenerator-runtime/runtime";
import Rails from 'rails-ujs';
Rails.start();
import '../src/application'
import '../modules/datatable'
import '../modules/markdownTextField'
import '../modules/datepicker'
import '../modules/profileCropper'
import '../modules/editUserToggle'
import '../modules/editUserOpenArms'
import '../modules/candidateValidator'
import '../modules/addNewPeer'
import '../modules/userValidator'
import '../modules/shave'
import '../modules/gallery'
import '../modules/tabSwitcher'
import '../modules/hidePictures'

import fontawesome from '@fortawesome/fontawesome';
import solid from '@fortawesome/fontawesome-free-solid';
import regular from '@fortawesome/fontawesome-free-regular';
fontawesome.library.add(solid)
fontawesome.library.add(regular)
console.log('Hello World from Webpacker')
