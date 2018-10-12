

$(function(){
    $("#load_projects").on("click", function(e){
        
        $.ajax({
            method: "GET",
            url: this.href
        }).done(function(response){
            response.forEach(function(item){
                let project = new Project(item);
                $("#user_projects").append("<li>" + project.formatProject() + "</li>")
               
            });

        });
        e.preventDefault();
    });
});

class Project{
    constructor(projectJson) {
        this.id = projectJson.id;
        this.name = projectJson.name;
        this.project_type = projectJson.project_type;
        this.cost = projectJson.cost;
    };

    formatProject() {
        return `${this.name}: This is a ${this.project_type} project that costs $${this.cost} to make.`;
    }
};

