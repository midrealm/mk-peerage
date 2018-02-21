import 'bootstrap'
import 'select2';
$.fn.select2.defaults.set( "theme", "bootstrap4" );
import './modules/datatable'
import './modules/markdownTextField'
import './modules/select2'
import './modules/datepicker'
import './modules/profileCropper'
import './modules/editUserToggle'
import './modules/editUserOpenArms'
import './modules/candidateValidator'
import './modules/addNewPeer'

import fontawesome from '@fortawesome/fontawesome';
import solid from '@fortawesome/fontawesome-free-solid';
import regular from '@fortawesome/fontawesome-free-regular';
fontawesome.library.add(solid)
fontawesome.library.add(regular)
