
//console.log("Hello!")

document.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll('i').forEach((node) =>
		node.addEventListener('click', (event) => {
          const pNode = event.target.parentElement.parentElement.children[1];
          if (pNode.style.display === "none") {
            pNode.style.display = "block";
            node.setAttribute('class','fa fa-minus-square')
          } else {
            pNode.style.display = "none";
            node.setAttribute('class','fa fa-plus-square')
          } 
        })
  );
});