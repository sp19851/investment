
const App = {
    
    data() {
        return {
            _chart: null,
            show: false, 
            showProperty: false,
            showStocks: true,
            total:0,
            /*ctx : document.getElementById('myChart').getContext('2d'),*/
            chart_labels : ['Сеть магазинов 24/7', 'Lifeinvader', 'Rogers Salvage&Scrap', 'Grand Banks Steel Inc Foundry', 'Humane Labs and Research'],
           
            dataset_label1: ['2018 Sales'],
            dataset_data1: [150, 300, 450, 840, 50],
            dataset_label2: ['2019 Sales'],
            dataset_data2: [50, 120, 150, 200, 145],
            dataset_label3: ['2020 Sales'],
            dataset_data3: [120, 100, 45, 15, 25],
            dataset_label4: ['2021 Sales'],
            dataset_data4: [30, 70, 45, 75, 45],
            dataset_label5: ['2022 Sales'],
            dataset_data5: [130, 170, 145, 175, 145],
            dataset_label6: ['2023 Sales'],
            dataset_data6: [50, 60, 55, 85, 95],
            dataset_label7: ['2024 Sales'],
            dataset_data7: [37, 76, 55, 73, 15, 73, 25],
            chart_type: 'bar',
            total: 1000,
            stocks: [
                {name: "Сеть магазинов 24/7", curs: 5000, amount: 0, freeamount: 900, totalamount: 1000, forsale:0, forbuy:0},
                {name: 'Lifeinvader', curs: 10000, amount: 0, freeamount: 708, totalamount: 1000, forsale:0, forbuy:0},
                {name: 'Rogers Salvage&Scrap', curs: 15000, amount: 0, freeamount: 658, totalamount: 1000, forsale:0, forbuy:0},
                {name: 'Grand Banks Steel Inc Foundry', curs: 35000, amount: 0, freeamount: 750, totalamount: 1000, forsale:0, forbuy:0},
                {name: 'Humane Labs and Research', curs: 50000, amount: 0, freeamount: 910, totalamount: 1000, forsale:0, forbuy:0},
            ],
        }
    
    },    
    
    components:{},
  

    methods: {
       
        showingForm(bool) {
            //console.log('funct showingForm', bool)
            this.show = bool;
          
        },

       
        onClose() {
            this.show = false;
            $.post('https://investment/close');

        },

        showingDiv(divName) {
            if(divName == "chart") {
                this.showProperty = true
                this.showStocks = false  
            } else{
                this.showProperty = false
                this.showStocks = true  
            }
        },

        onCart() {
            
        },

        onRefresh() {
            $(document.getElementById('my-chart')).remove();
            $(document.getElementById('property')).append('<canvas id="my-chart" width="500" height="300"></canvas>');
            
            const cart = new Chart(document.getElementById('my-chart'), {
                    type: this.chart_type,
                    data: {
                        labels: this.chart_labels,
                        defaultFontColor:"white",
                        datasets: [
                                {label: this.dataset_label1, data: this.dataset_data1, backgroundColor: "crimson",  defaultFontColor: 'red',},
                                {label: this.dataset_label2, data: this.dataset_data2, backgroundColor: "blue"},
                                {label: this.dataset_label3, data: this.dataset_data3, backgroundColor: "teal"},
                                {label: this.dataset_label4, data: this.dataset_data4, backgroundColor: "coral"},
                                {label: this.dataset_label5, data: this.dataset_data5, backgroundColor: "cornflowerblue"},
                                {label: this.dataset_label6, data: this.dataset_data6, backgroundColor: "brown"},
                                {label: this.dataset_label7, data: this.dataset_data7, backgroundColor: "cyan"},
                                
                                
                        ]
                        /*[
                        {label: ['2018 Sales'],data: [150, 300, 450, 840, 50]},
                        {label: ['2019 Sales'],data: [50, 120, 150, 200, 145]},
                        {label: ['2020 Sales'],data: [120, 100, 45, 15, 25]},
                        {label: ['2021 Sales'], data: [30, 70, 45, 75, 45]},
                        {label: ['2022 Sales'], data: [130, 170, 145, 175, 145]},
                        {label: ['2023 Sales'],data: [50, 60, 55, 85, 95]},
                        {label: ['2024 Sales'], data: [37, 76, 55, 73, 15]},
                    ]*/
                    },
                    options: {
                        indexAxis: 'y',
                        axisY: {
                            labelFontSize: 68,
                            labelFontColor: "red",
                        },
                        plugins: {
                            datalabels: {
                                color: 'orange'
                            },
                            title: {
                            display: true,
                            text: 'Курс акций за неделю',
                            color: "white",
                            },
                        },
                        legend: {
                            labels: {
                            fontColor: 'white' //set your desired color
                            }
                        },
                    },
                
                });
            

        },
        onSale (event, item) {
            //console.log('sale', item.name, item.forsale, item.curs)
            $.post('https://investment/sale', JSON.stringify(item));
        },
        onBuy (event, item) {
            //console.log('sale', item.name, item.forsale, item.curs)
            $.post('https://investment/buy', JSON.stringify(item));


        },
      
},
    
    mounted() {
        this.listener = window.addEventListener("message", (event) => {
            //console.log('test window.addEventListener', event.data.action)
            if(event.data.action === 'open') {
                this.showingForm(true);
                //{date = os.date('%x',v.date), curs = v.curs}
                //this.dataset_label1 = event.data.templabel
                
                this.dataset_data1 = event.data.dataset_6
                this.dataset_label1 = event.data.label_6
                this.dataset_data2 = event.data.dataset_5
                this.dataset_label2 = event.data.label_5
                this.dataset_data3 = event.data.dataset_4
                this.dataset_label3 = event.data.label_4
                this.dataset_data4 = event.data.dataset_3
                this.dataset_label4 = event.data.label_3
                this.dataset_data5 = event.data.dataset_2
                this.dataset_label5 = event.data.label_2
                this.dataset_data6 = event.data.dataset_1
                this.dataset_label6 = event.data.label_1
                this.dataset_data7 = event.data.dataset
                this.dataset_label7 = event.data.label
                this.stocks = event.data.stocks
                this.total = event.data.total
                let type = 'open'
                this.onRefresh()
                   /*for(let i = 0; i < this.employees.length; i++) {
                    let Item = this.employees[i];
                    //console.log(i, Item.id, Item.rang)
                };*/


            } else if(event.data.action === 'close') {
                this.onClose()
            } else if(event.data.action === 'refresh') {
                /*for(let i = 0; i < this.employees.length; i++) {
                    let Item = this.employees[i];
                    //console.log(i, Item.id, Item.rang)
                };*/
                this.dataset_data1 = event.data.dataset_6
                this.dataset_label1 = event.data.label_6
                this.dataset_data2 = event.data.dataset_5
                this.dataset_label2 = event.data.label_5
                this.dataset_data3 = event.data.dataset_4
                this.dataset_label3 = event.data.label_4
                this.dataset_data4 = event.data.dataset_3
                this.dataset_label4 = event.data.label_3
                this.dataset_data5 = event.data.dataset_2
                this.dataset_label5 = event.data.label_2
                this.dataset_data6 = event.data.dataset_1
                this.dataset_label6 = event.data.label_1
                this.dataset_data7 = event.data.dataset
                this.dataset_label7 = event.data.label
                this.stocks = event.data.stocks
                this.total = event.data.total
                let type = 'refresh'
                this.onRefresh()

            }
            
        });
        window.document.onkeydown = event => event && event.code === 'Escape' ? this.onClose() : null
       
       
           /*{
            label: 'Dataset 1',
            data: Utils.numbers(NUMBER_CFG),
            borderColor: Utils.CHART_COLORS.red,
            backgroundColor: Utils.transparentize(Utils.CHART_COLORS.red, 0.5),
          },
          {
            label: 'Dataset 2',
            data: Utils.numbers(NUMBER_CFG),
            borderColor: Utils.CHART_COLORS.blue,
            backgroundColor: Utils.transparentize(Utils.CHART_COLORS.blue, 0.5),
          }*/

      },
    create: {
        

    },
    watch: {
        currentShopItem(newValue) {
           // console.log('currentShopItem', newValue)
        },
        showStore(newValue) {
           // console.log('showStore', newValue)
        },
    },

    
}




let app = Vue.createApp(App)
app.mount('#app')