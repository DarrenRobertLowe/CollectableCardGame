///fx_create_lightning_branch();

var branch = instance_create(endX, endY, fx_lightning_branch);
branch.length = length * random_range(0.5, 0.8);  // Reduce length for new branches
branch.branches = branches-1;

var next_chonkiness = chonkiness * 0.75;
branch.chonkiness = next_chonkiness;

var choice = choose(0, 1);
var angleVariation = round(random_range(20, 40));

switch(choice) {
    case 0:
        branch.direction = (direction + angleVariation);
    break;
    
    case 1:
        branch.direction = (direction - angleVariation);
    break;
}
