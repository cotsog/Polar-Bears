import Marionette from 'backbone.marionette';

/**
 * Base View for Collections.
 */
export default class BaseViewCollection extends Marionette.CompositeView {}
BaseViewCollection.prototype.modelEvents = { 'all': 'render' };
BaseViewCollection.prototype.childViewContainer = 'tbody';
BaseViewCollection.prototype.allowMultipleSelection = false;