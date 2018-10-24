

$(function(){
    
    let url = window.location.href
    let getUrl = `${url}/recommendations`
  $.ajax({
      method: "GET",
      url: getUrl
      
  }).done(function(response){
      response.forEach(function(item){
          let recommendation = new Recommendation(item)
          debugger
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


}