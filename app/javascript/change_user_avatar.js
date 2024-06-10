if (!change_avatar_btn && !avatar_file_field && !avatar_form){
  let change_avatar_btn = document.getElementById('change_avatar_btn');
  let avatar_file_field = document.getElementById('avatar_file_field');
  let avatar_form = document.getElementById('avatar_form');
}
change_avatar_btn.addEventListener("click", () => avatar_file_field.click());
console.log(5+2);
avatar_file_field.addEventListener("change", () => avatar_form.submit());
