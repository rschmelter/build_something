

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
                $userProjects.append(`<div id=${project.id}>` + "<li>" + project.formatIntro() + "<br>" + "<a href="+url+" class='full_project'>See Full Project</a>"  + "<br>" + "Materials Required:" + "<br>" + `<ul class=${project.id}></ul>` + "</li>" + "</div>")

                materials.forEach(function(mat){
                    $(`.${project.id}`).append("<li>" + mat.material_name + "</li>")
                });                
            });
        });
        e.preventDefault();
    });
});

$(function(){
    $(".full_project").on("click", function(e){
        $.ajax({
            method: "GET",
            url: this.href           
        }).done(function(response){
           response.forEach(function(item){
               debugger
           })
           

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
        return `Name: ${this.name} <br> Project Type: ${this.project_type} <br> Cost: ${this.cost} <br> Difficulty: ${this.difficulty} <br> <div id=${this.id}></div> <br> Instructions: <br> ${this.instructions} <br>`
    }

};

