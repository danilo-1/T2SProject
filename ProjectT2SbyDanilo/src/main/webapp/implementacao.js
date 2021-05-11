/**
 * 
 */
var app = new Vue({
	
	el: '#app', data:{
		inicio: 'Página incial',
		variants: [
			{
				variantId: 2234,
				variantColor: 'add',
				add: 'true'
			},
			{
				variantId: 2235,
				variantColor: 'update',
				update: 'true'
			}
		]
		
	},
	methods:{
			Updateform: function(variantImage){
				this.image = variantImage
			}
		}
	
})