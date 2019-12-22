import 'bootstrap'
import 'bootstrap-select';
import Rails from 'rails-ujs';
Rails.start();

import './modules/datatable'
import './modules/markdownTextField'
import './modules/datepicker'
import './modules/profileCropper'
import './modules/editUserToggle'
import './modules/editUserOpenArms'
import './modules/candidateValidator'
import './modules/addNewPeer'
import './modules/userValidator'
import './modules/shave'

import fontawesome from '@fortawesome/fontawesome';
import solid from '@fortawesome/fontawesome-free-solid';
import regular from '@fortawesome/fontawesome-free-regular';
fontawesome.library.add(solid)
fontawesome.library.add(regular)
