# PFL-PROJECT

## BigNumber.hs

### CASOS DE TESTE, EXPLICAÇÃO SUCINTA DA FUNÇÃO E ESTRATÉGIAS UTILIZADAS
------------------------------------------------
### SOMA

#### Sinais : somaBN

> **1. Soma de 2 BigNumbers Positivos** 
> 
> Resultado Positivo e é efetuada a soma ao respetivo valor absoluto do BigNumber 
>
> `somaBN (Positive[3])(Positive[2]) = Positive [5]`
>
> **2. Soma de 2 BigNumbers negativos** 
> 
>Resultado Negativo e é efetuada a soma ao respetivo valor absoluto do BigNumber 
>
>`somaBN (Negative[3])(Negative[2]) = Negative [5]`
>
>**3. Soma de 1 BigNumber Positivo com 1 BigNumber Negativo** 
>
> É efetuada a subtração do BigNumber Positivo pelo BigNumber Negativo, considerando ambos os BigNumbers Positivos
>
>`somaBN (Positive[3])(Negative[2]) = Positive [1]`
>
> **4. Soma de 1 BigNumber Negativo com 1 BigNumber Negativo**
>
> É efetuada a subtração do BigNumber Positivo pelo BigNumber Negativo, considerando ambos os BigNumbers Positivos
>
>`somaBN (Negative[3])(Positive[2]) = Negative [1]`

#### Soma de números com quantidades diferentes de dígitos :somaBNAux

> **5. Soma de BigNumber1 com BigNumber2 , onde BigNumber1 tem mais dígitos** 
> 
> Enchemos BigNumber2 com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos
>    
> Soma efetuada normalmente
> 
> **6. Soma de número BigNumber1 com número BigNumber2 , onde BigNumber2 tem mais dígitos**  
> 
> Enchemos BigNumber1 com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos.
> 
> Soma efetuada normalmente
> 

#### Soma de números com número igual de dígitos : somaBNAux1
> **7. Soma normal de duas listas de Dígitos** 
> 
> **Algoritmo da "Primária"** : Começamos a iterar as listas dos dígitos do BigNumber somando par a par (exemplo: 2+3 = 5, 1+5 = 6 => [1,6])
> 
> `somaBN (Positive[1,3])(Positive[5,2]) = Positive [1,6]`
> 
> **8. Soma de dois Dígitos superior a 10**
> 
> Nesta função existe um campo **overflow** que serve para assegurar a soma correta nos casos em que a soma de dois dígitos é superior a 10. Assim, tem o valor default de 0, e assume o valor do "excesso":
> 
> No exemplo seguinte a soma 8 + 2 = 10 tem resto 0 e divisão inteira de 1 pelo que na soma dos dígitos seguintes é adicionado 1 a esse valor:
> 
> `somaBN (Positive[8,2,1])(Positive[2,1,1]) = Posittive [0,4,2]`
> 
> **9. Resultado da soma tem número superior de dígitos a qualquer um dos números**
> 
> Quando o o "overflow" da soma é diferente de 0, acrescenta esse dígito no campo mais significativo do número (ex: 8 + 2 = 10) -> overflow = 1
> 
> `somaBN (Positive[8])(Positive[2]) = Positive [0,1]`

------------------------------------------------
### 2 . SUBTRAÇÃO

##### 2.1 Sinais
> __1. Subtração de um BigNumber Positivo por um Negativo__  
> 
> Neste caso o sinal da operação é Positivo e é efetuada a soma dos valores absolutos dos BigNumbers
> 
> `subBN (Positive[3])(Negative[2]) = Positive[5]`
> 
> __2. Subtração de um BigNumber Positivo por um Negativo__  
> 
> Neste caso o sinal da operação é Negativo e é efetuada a soma dos valores absolutos dos BigNumbers
> 
> `subBN (Negative[3])(Positive[2]) = Negative[5]`
> 
> __3. Subtração entre 2 BigNumbers Positivos__ 
> 
> Quando o caso 2.2 não se aplica, procedimento 2.3 é aplicado 
> 
> `subBN (Positive[3])(Positive[2]) = Positive[1]`
> 
> __4. Soma de 2 BigNumber Negativos__ 
> 
> Quando o caso 2.2 não se aplica, procedimento 2.3 é aplicado 
> 
> `subBN (Negative[3])(Positive[2]) = Negative[2]`

##### 2.2 Quando o resultado da subtração é 0

> **1. Subtração de BigNumbers com sinal e valor absoluto iguais**  
> 
> Neste caso, não se segue para a função auxiliar para calcular normalmente a subtração e devolve- se simplesmente Positive [0].
> 
> `subBN (Positive[3])(Positive[3]) = Positive[0]`
> 
> `subBN (Negative[3])(Negative[3]) = Positive[0]`

##### 2.3 Quando o valore absoluto dos BigNumbers é Diferente

> **1. Lista de Dígitos de BigNumber1 maior que lista de Dígitos de BigNumber2**
> 
> Neste caso, tal como na soma, enchemos BigNumber2 com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos
> 
> `subBN (Positive[0,3])(Positive[2]) = Positive[8,2]`
> 
> **2. Lista de Dígitos de BigNumber1 menor que lista de Dígitos de BigNumber2**
> 
> Neste caso, tal como na soma, enchemos BigNumber1 com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos
> 
> `subBN (Positive[3])(Positive[0,2]) = Negative[7,1]`
> 
> **3. Listas de Dígitos de BigNumber1 e BigNumber2 com mesmo tamanho e valor absoluto de BigNumber1 superior ao de BigNumber2**
> 
> `subBN (Positive[0,3])(Positive[0,2]) = Positive[0,1]`
> 
> **4. Listas de Dígitos de BigNumber1 e BigNumber2 com mesmo tamanho e valor absoluto de BigNumber1 inferior ao de BigNumber2**
> 
> `subBN (Positive[0,2])(Positive[0,3]) = Negative[0,1]`



##### Diminuição das casas 

------------------------------------------------
### 3. MULTIPLICAÇÃO

#### Sinais : mulBN

> __1. Multiplicação de BigNumbers com o mesmo sinal__
> 
> Resultado tem sinal Positivo e é efetuada a multiplicação do valor absoluto do BigNumber
> 
> `mulBN (Positive[3])(Positive[3]) = Positive[9]`
> 
> `mulBN (Negative[3])(Negative[3]) = Positive[9]`
> 
> __1. Multiplicação de BigNumbers sinais diferentes__
> 
> Resultado tem sinal Positivo e é efetuada a multiplicação do valor absoluto do BigNumber
> 
>  `mulBN (Positive[3])(Negative[3]) = Negative[9]`
>  
>  `mulBN (Negative[3])(Positive[3]) = Negative[9]`

#### Multiplicação de uma lista de dígitos por um valor : mulAux1

>  Recorrendo à função **map** do prelúdio, multiplicamos cada dígito dessa lista por esse valor
>  
>  `mulAux1 [1,2,3,4] 2 = [2,4,6,8]`

#### Multiplicação das listas de dígitos de BigNumbers : mulAux2

> **1. Multiplicação de uma lista por outra com tamanho superior a 1** 
> 
> Por cada dígito da segunda lista, multiplicamos todos os dígitos da primeira lista por esse valor
> 
> Variável **counter** inicializada a 0, sendo incrementada (+1) por cada chamada à função mulAux1
> 
> Depois de se efetuar a multiplicação da primeira lista por cada elemento da segunda, somam se todas as listas obtidas com o auxílio da função **somaBN** explicada anteriormente
> 
>  ` mulBN (Positive [1,3]) (Positive [2,1]) = Positive [2,7,3] `
>  
>  **NOTA** : 
>		Neste exemplo multiplicamos [1,3] por [1] = [1,3] e depois [1,3] por [2] = [2,6]
>  		Como é iterado duas vezes [1,3] é enchido por 1 zero ficando [0,1,3] e [2,6] permanece igual
>  		No final somam- se as duas listas [1,3,0] + [2,6] = [2,7,3]


------------------------------------------------
#### 4. DIVISÃO

#### Sinais

> **1. Divisão de BigNumbers com o mesmo sinal**
> 
> `divBN (Positive [0,2]) (Positive [4]) = (Positive [5],Positive [0])`
> 
> `divBN (Negative [0,2]) (Negative [4]) = (Positive [5],Positive [0])`
> 
> **2. Divisão de BigNumbers com sinais diferentes**
> 
> `divBN (Positive [0,2]) (Negative [4]) = (Negative [5],Positive [0])`
> 
> `divBN (Negative [0,2]) (Positive [4]) = (Negative [5],Positive [0])`

#### Algoritmo de Divisão
> A divisão implementada baseia-se no seguinte algoritmo:

<code>
	q=0
	r=n
	while(r>d){
  		r=r-d
  		q=q+1
	}
</code>. 

------------------------------------------------
## Fib.hs

### Função recursiva : fibRec
> Implementação recursiva do cálculo do enésimo número de Fibonacci

### Otimização da função anterior : fibLista
> Implementação otimizada da versão recursiva do cálculo do enésimo número de Fibonacci (**programação dinâmica**)
> 
> Recorreu- se a uma lista de resultados parciais tal que (lista !! i) contém o número de Fibonacci de ordem i

### Lista infinita com todos os números de Fibonnaci e returnar elemento n
> Implementação do cálculo do enésimo número de Fibonacci com auxílio de uma lista infinita com todos os números de Fibonnacci
> 
> Retorna elemento de ordem n



------------------------------------------------

### RESPOSTA A ALÍNEA 4

>**Compare as resoluções das alíneas 1 e 3** com tipos (Int -> Int), (Integer ->
Integer) e (BigNumber -> BigNumber), comparando a sua aplicação a números grandes
e verificando qual o maior número que cada uma aceita como argumento.

------------------------------------------------
| Name             | E-Mail              |
| ---------------- |-------------------- |
| Sofia Germer     | up201907461@up.pt   |
| Miguel Lopes     | up201704590@up.pt   |
