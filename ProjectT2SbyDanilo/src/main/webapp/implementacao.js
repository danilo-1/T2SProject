/**
 * 
 */
var app = new Vue({
    el: '#app',
    data() {
       return {
        showEl: false

        }
    },
methods: {
  exibirFormulario: function(){
   this.showEl = true;
		}
	}

})
