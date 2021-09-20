function onload() {
    function getTree(el, deep=0) {
        console.log(el);

        const children = [...el.children];
        const tabs = '&nbsp'.repeat(8 * deep);
        return tabs + el.tagName + '<br>' + children.reduce((prev, el) => prev + getTree(el, deep + 1), '');
    }

    const btn = document.getElementById('btn');
    btn.addEventListener('click', () => {
        const resEl = document.getElementById('result');
        resEl.innerHTML = getTree(document.body);
    });
}

window.addEventListener('load', onload);

