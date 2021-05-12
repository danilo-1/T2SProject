/**
 * 
 */
var app = new Vue({
    el: '#app',
    data() {
       return {
        v1: false

        }
    },
methods: {
  exibirForm: function(){
   this.v1 = true;
}
}

})