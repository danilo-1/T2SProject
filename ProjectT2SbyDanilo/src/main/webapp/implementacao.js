/**
 * 
 */
var app = new Vue({
	
	el: '#app', data:{
		inicio: 'Página incial',
		add: 'null',
		selectVariant:false,
		update:'null',
		variants: [
			{
				variantId: 2234,
				variantColor: 'add',
				
				
			},
			{
				variantId: 2235,
				variantColor: 'update',
				
				
				
			}
		]
		
	},
	methods:{
			Updateform: function(index){
				this.selectVariant = index
			}
		}
	
})