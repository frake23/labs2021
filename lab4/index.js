function state() {
    return {
        goods: [],
        orders: [],
        addGood(e) {
            e.preventDefault();
            const data = new FormData(document.forms.goodsForm);
            const name = data.get('name');
            const intPrice = parseInt(data.get('price'));
            if (!intPrice || !name) {
                alert('Проверьте введенные данные');
                return;
            }
            this.goods.push(new Good(data.get('name'), intPrice));
            document.forms.goodsForm.reset();
        },
        removeGood(index) {
            this.goods.splice(index, 1);
        },
        addOrder(good) {
            let order = this.orders.find(o => o.good.id === good.id);
            if (!order)
                this.orders.push(new Order(good))
            else
                order.count++;
        },
        removeOrder(order, index) {
            if (!--order.count)
                this.orders.splice(index, 1);
        },
        get ordersPrice() {
            return this.orders.reduce((res, order) => res + order.count * order.good.price, 0);
        },

    }
}

class Good {
    constructor(name='', price=0) {
        this.name = name;
        this.price = price;
        this.id = ++Good._counter;
    }
    static _counter = 0;
}

function Order(good) {
    this.good = good;
    this.count = 1;
}

function f() {
    return {
        f() {console.log(this)}
    }
}
