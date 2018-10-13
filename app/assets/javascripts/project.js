

$(function(){
    $("#load_projects").on("click", function(e){
        $.ajax({
            method: "GET",
            url: this.href
        }).done(function(response){
            let $userProjects = $("#user_projects")
            $userProjects.html("")
            response.forEach(function(item){
                let project = new Project(item);
                let materials = project.materials
                // let $projectLi = $userProjects.append(`<li id><ul class=${project.id}></ul></li>`)
                
                
                let url = `/users/${project.user_id}/projects/${project.id}`
                $userProjects.append("<li>" + project.formatIntro() + "<a href="+url+">See Full Project</a>"  + `<ul class=${project.id}></ul>` + "</li>")

                // $projectLi.append(project.formatIntro() + "<a href="+url+">See Full Project</a>")
                materials.forEach(function(mat){
                    $(`.${project.id}`).append("<li>" + mat.material_name + "</li>")
                });
                
            });

        });
        e.preventDefault();
    });
});

class Project{
    constructor(projectJson) {
        this.id = projectJson.id;
        this.user_id = projectJson.user_id;
        this.name = projectJson.name;
        this.project_type = projectJson.project_type;
        this.cost = projectJson.cost;
        
        this.materials = projectJson.materials;
    };

    formatIntro() {
        return `${this.name}: This is a ${this.project_type} project that costs $${this.cost} to make.`;
    }

};

