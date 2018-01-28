<template>
<div class="container"> 
    <div>
        <h4 class="name_header">Welcome back, Jenny</h4>
        <p>You've embarked on the <u>Weight Loss Journey</u> <i class="fas fa-chevron-circle-down"></i> <br>Click to check out our best picks and you may just find a surprise promo! </p> 
    </div>
    <button v-on:click="showCards()">Show Cards</button>
	<transition-group name="list" tag="div" class="row">
        
		<div v-bind:key="c.id" v-for="c in cards" class="col-md-4" v-on:click="selectCard(c.id)" v-bind:class="{selected_card: c.selected, faded: c.faded}">
            <transition name="flip">
                <div class="offer-grid offer_card" v-bind:style="{background: c.color}">

                    <div class="filler" v-show="'none' == c.state">
                        <img class="offer-pic img-responsive" v-bind:src="c.img" alt="Image"/>
                        <p class="offer-text">{{c.description}}</p>
                    </div>

                    <div class="overlay" v-show="'selected' == c.state">
                        <i class="fas fa-tag"></i>
                        <br>
                        <br>
                        <h3>25% off {{c.description}}!</h3>
                        <br>
                        <button v-on:click="claimCard(c.id)" class="offer-cta" style="color: #D12263">Claim Offer</button>
                    </div>

                    <div class="filler" v-show="'claimed' == c.state">
                        <br>
                        <br>
                        <i class="fas fa-check" style="font-size: 60pt"></i>
                        <br/>
                        <p class="offer-text"> <i class="fas fa-tag clicked"></i> And it's all yours!
			 	        <br>25% off {{c.description}} </p>
                    </div>

                </div>
            </transition>
		</div>
	</transition-group>
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
import store from '../store.js'
import router from '../router'
// delay for cards
const cardDelay = 200

export default {
  name: 'Game',
  components: {},
  data:function(){
      return {
          cardStock:[
              {id: 1, state: 'none', faded: false, color:'#685BA3', img: grid_img, description: 'Whey protein powder'},
              {id: 2, state: 'none', faded: false, color:'#D12263', img: grid_img, description: 'Whey protein powder'},
              {id: 3, state: 'none', faded: false, color:'#F58E28', img: grid_img, description: 'Whey protein powder'}
          ],
          cards: [],
          hasBeenSelected: false
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
          if(this.hasBeenSelected){
              return
          }
          this.cards.map(function(c,i){
              if(c.id == id){
                  c.state = 'selected'
                  c.faded = false
              }else{
                  c.faded = true
                  c.state = 'none'
              }
          })
          this.hasBeenSelected = true
      },
      claimCard: function(id){
          this.cards.map(function(c,i){
              if(c.id == id){
                 console.log(id)
                  c.state = 'claimed'
                  c.faded = false
                 console.log(c)                  
                  store.product = c
              }else{
                  c.faded = true
                  c.state = 'none'
              }
          })
          setTimeout(this.nextRoute, 1000)
      },
      nextRoute: function(c){
          router.push('voucher')
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
    .offer_card:hover{
        /* border:10px solid black */
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
    .overlay {
        padding: 20px
    }

</style>
