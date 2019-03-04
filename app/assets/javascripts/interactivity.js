
console.log("Hello!")

document.querySelectorAll('i.fa').forEach((node) =>
		node.addEventListener('click', (event) => {
            console.log('Page has been clicked!');
            //const descriptionNode = document.createElement('p');
            //const h1 = document.createElement('h1');
            //h1.innerText = `${@idea.description}`;
            //descriptionNode.append(h1);
          })
);