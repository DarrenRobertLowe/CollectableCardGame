///isContestant(target id);
var target = argument0;

if (exists(target)) {
    if (object_is_ancestor(target.object_index, CONTESTANT)) {
        return true;
    }
}
