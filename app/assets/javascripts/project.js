

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

class Project{
    constructor(projectJson) {
        this.id = projectJson.id;
        this.name = projectJson.name;
        this.project_type = projectJson.project_type;
    };

    formatProject() {
        return `${this.name} is a ${this.project_type} project`;
    }
};

// grab attributes to append to the page.