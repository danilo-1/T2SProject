/**
 * 
 */
var app = new Vue({
	
	el: '#app', data:{
		inicio: 'Página incial',
		add: 'null',
		
		v1: false,
		selectVariant:false,
		update:'null',
		variant:[{
			variantId:20,
			variantQuant: true,
		},{
			variantId:21,
			variantQuant: true,
		}
		],
		
	
	methods:{
			exibirForm: function(){
				this.v1= true
			},
		}
	},
})