<template>
<div class="container"> 
    <div>
        <h4 class="name_header">Welcome back, Jenny</h4>
        <p>You've embarked on the <u>Weight Loss Journey</u> <i class="fas fa-chevron-circle-down"></i> <br>Click to check out our best picks and you may just find a surprise promo! </p> 
    </div>
    <button v-on:click="showCards()">Show Cards</button>
	<transition-group name="list" tag="div" class="row">
        
		<div v-bind:key="c.id" v-for="c in cards" class="col-md-4" v-on:click="selectCard(c.id)">
            <transition name="flip">
                <div class="offer-grid" v-bind:style="{background: c.color}">
                <img class="offer-pic img-responsive" v-bind:src="c.img" alt="Image">
                <p class="offer-text">{{c.description}}</p>
                </div>
            </transition>
		</div>
	</transition-group>
		<!-- <div class="col-md-4">
			<div class="offer-grid" style="background: #D12263">
				<div class="offer-viewed">
					<i class="fas fa-tag"></i>
					<br>
					<br>
				 	<h3>25% off Whey Protein Powder!</h3>
				 	<br>
				 	<p class="offer-cta" style="color: #D12263">Claim Offer</p>
			 	</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="offer-grid" style="background-color: #F58E28;">
		  		<img class="offer-pic img-responsive" src="../assets/img/grid1.png" alt="Image">
			 <p class="offer-text"> <i class="fas fa-tag clicked"></i> And it's all yours!
			 	<br>25% off Whey Protein Powder </p>
			 <br>
		  	</div>
		</div> -->
	<br>
	<br>
		<h5>So tell us, how did you like your last purchase?</h5>

	<div class="row">
		<div class="col-md-4">
			<div class="offer-bg">
			  <img class="rate-pic img-responsive" src="../assets/img/rate-product.jpg" alt="Image">
			  <p class="offer-text text-center">La Roche Posay Effaclar Duo Cleanser</p>
			  <div class="circle">
			  	<i class="fa fa-thumbs-up" style="font-size: 14px;"></i>
			  </div>
			  <div class="circle">
			  	<i class="fa fa-thumbs-down" style="padding-top: 3px; padding-bottom: 0px"></i>
			</div>
		</div>

		<div class="col-md-4">
			
		</div>
		<div class="col-md-4">
			
		</div>
		
	</div>
  </div>
</div>
<!-- <div class="container-fluid">
    <button v-on:click="showCards()">Show Cards</button>
    <transition-group name="list" tag="div" class="row">
        <div class="col-md-1" v-bind:key="'temp'"></div>
        <div v-for="c in cards" class="col-md-2 offset-md-1 offer" v-bind:key="c.id" v-bind:class="{selected_card: c.selected, faded: c.faded}" v-on:click="selectCard(c.id)">
            {{c.id}}
        </div>
    </transition-group>
</div> -->
</template>

<script>
import grid_img from '../assets/img/grid1.png'
// delay for cards
const cardDelay = 200

export default {
  name: 'Game',
  components: {},
  data:function(){
      return {
          cardStock:[
              {id: 1, selected: false, faded: false, color:'#685BA3', img: grid_img, description: 'Whey protein powder'},
              {id: 2, selected: false, faded: false, color:'#D12263', img: grid_img, description: 'Whey protein powder'},
              {id: 3, selected: false, faded: false, color:'#F58E28', img: grid_img, description: 'Whey protein powder'}
          ],
          cards: []
      }
  },
  methods: {
      showCards: function() {
        this.transferAllCards()
      },
      transferCard: function(){
          if(this.cardStock.length > 0){
              this.cards.push(this.cardStock.shift())
          }
      },
      transferAllCards: function(){
          this.transferCard()
          setTimeout(this.transferAllCards,cardDelay)
      },
      selectCard: function(id){
          this.cards.map(function(c,i){
              if(c.id == id){
                  c.selected = true
              }else{
                  c.faded = true
              }
          })
      }

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    .offer {
        border:1px solid black;
        height: 300px;
        transition:opacity 0.5s linear;
    }
    .list-item {
        display: inline-block;
        margin-right: 10px;
    }
    .list-enter-active, .list-leave-active {
        transition: all 1s;
    }
    .list-enter, .list-leave-to /* .list-leave-active below version 2.1.8 */ {
        opacity: 0;
        transform: translateY(30px);
    }
    .fullwidth {
        width: 100%;
    }
    .selected_card {
        /* margin-top: -20px */
    }
    .faded {
         opacity: 0.2;
    }
    .name_header {
        display: inline-block;
    }
</style>
