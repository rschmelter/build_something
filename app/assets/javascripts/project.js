

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
               
                
                let url = `/users/${project.user_id}/projects/${project.id}`
                $userProjects.append(`<div id=${project.id}>` + "<li>" + project.formatIntro() + "<br>" + "<a class='full_project' href=" + url + "> See Full Project </a>"  + "<br>" + "Materials Required:" + "<br>" + `<ul class=${project.id}></ul>` + "</li>" + "</div>")

                materials.forEach(function(mat){
                    $(`.${project.id}`).append("<li>" + mat.material_name + "</li>")
                });                
            });
        });
        e.preventDefault();
    });
});

$(function(){
    
    $("body").on("click", ".full_project", function(e){
        e.preventDefault();
        
        $.ajax({
            method: "GET",
            url: this.href           
        }).done(function(response){
            let project = new Project(response);
            let $projectDiv = $(`#${project.id}`);
            
            $projectDiv.html("");
            $projectDiv.append(project.formatFullProject());
            
            project.materialsArray().forEach(function(item){
                $(`#${project.id}material`).append("<li>" + item + "</li>");
            });
        });
        
    });
    
});





class Project{
    constructor(projectJson) {
        this.id = projectJson.id;
        this.user_id = projectJson.user_id;
        this.name = projectJson.name;
        this.project_type = projectJson.project_type;
        this.cost = projectJson.cost;
        this.difficulty = projectJson.difficulty;
        this.instructions = projectJson.instructions;

        this.projectMaterials = projectJson.project_materials;        
        this.materials = projectJson.materials;
    };

    formatIntro() {
        return `${this.name}: This is a ${this.project_type} project that costs $${this.cost} to make.`;
    }

    getMaterial(id) {
        let material = this.materials.find(x => x.id === id);
        return material.material_name
    }

    materialsArray() {
       let items = []
       this.projectMaterials.forEach(function(pm){
           items.push(`Material: ${this.getMaterial(pm.material_id)} | Size: ${pm.size} | Quantity: ${pm.quantity}`)
       }.bind(this))
       return items
    }

    formatFullProject() {
        return `Name: ${this.name} <br> Project Type: ${this.project_type} <br> Cost: ${this.cost} <br> Difficulty: ${this.difficulty} <br> Materials Required: <br> <ul id=${this.id}material></ul> <br> Instructions: <br> ${this.instructions} <br> <br>`
    }

};

