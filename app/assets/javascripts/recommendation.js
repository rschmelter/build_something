

$(function(){
    
    let url = window.location.href
    let getUrl = `${url}/recommendations`
  $.ajax({
      method: "GET",
      url: getUrl
      
  }).done(function(response){
      response.forEach(function(item){
          let recommendation = new Recommendation(item)
          $("#material_recommendations").append("<li>" + recommendation.formatRecommendation() + "</li>")
      })
  })

})

$(function(){
    $("#new_recommendation").on("submit", function(e){
       e.preventDefault();
       debugger
       $.ajax({
           method: "POST",
           url: this.action 
       })
    })
    
})





class Recommendation {
    constructor(recommendationJson){

    this.id = recommendationJson.id;
    this.name = recommendationJson.name;
    this.cost = recommendationJson.cost;
    this.buy = recommendationJson.buy;
    };

    formatRecommendation() {
       return `Name: ${this.name} <br> Cost: $${this.cost} <br> Where to Buy: ${this.buy} <br><br>` 
    }


}