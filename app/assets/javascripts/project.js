// $(document).ready(function() {
//     $("H1").hover(function(){
//         $(this).fadeOut(100);
//     });
// })

$(function(){
    $("#load_projects").on("click", function(e){
        
        $.ajax({
            method: "GET",
            url: this.href
        }).done(function(response){
            console.log(response)

        });
        e.preventDefault();
    });
});