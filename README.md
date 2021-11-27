# PFL-PROJECT

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

####7. Soma de números com número igual de dígitos : somaBNAux1
> **Algoritmo da "Primária"**
> 
> Começamos a iterar as listas dos dígitos do BigNumber somando par a par (exemplo: 2+3 = 5, 1+5 = 6 => [1,6])
> 
> `somaBN (Positive[1,3])(Positive[5,2]) = Positive [1,6]`
> 
> **Soma de dois Dígitos superior a 10**
> 
> Nesta função existe um campo **overflow** que serve para assegurar a soma correta nos casos em que a soma de dois dígitos é superior a 10. Assim, tem o valor default de 0, e assume o valor do "excesso":
> 
> No exemplo seguinte a soma 8 + 2 = 10 tem resto 0 e divisão inteira de 1 pelo que na soma dos dígitos seguintes é adicionado 1 a esse valor:
> 
> `somaBN (Positive[8,2,1])(Positive[2,1,1]) = Posittive [0,4,2]`
> 
> **Resultado da soma tem número superior de dígitos a qualquer um dos números**
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

> 1. **Lista de Dígitos de BigNumber1 maior que lista de Dígitos de BigNumber2**
> 
> Neste caso, tal como na soma, enchemos BigNumber2 com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos
> 
> `subBN (Positive[0,3])(Positive[2]) = Positive[8,2]`
> 
> 2. **Lista de Dígitos de BigNumber1 menor que lista de Dígitos de BigNumber2**
> 
> Neste caso, tal como na soma, enchemos BigNumber1 com zeros não significativos de forma a ambos ficarem com o mesmo número de dígitos
> 
> `subBN (Positive[3])(Positive[0,2]) = Negative[7,1]`
> 
> 3. **Listas de Dígitos de BigNumber1 e BigNumber2 com mesmo tamanho e valor absoluto de BigNumber1 superior ao de BigNumber2**
> 
> `subBN (Positive[0,3])(Positive[0,2]) = Positive[0,1]`
> 
> 4. **Listas de Dígitos de BigNumber1 e BigNumber2 com mesmo tamanho e valor absoluto de BigNumber1 inferior ao de BigNumber2**
> 
> `subBN (Positive[0,2])(Positive[0,3]) = Negative[0,1]`



##### Diminuição das casas 

------------------------------------------------
#### 3. MULTIPLICAÇÃO
#### Sinais
> __1. Multiplicação de BigNumbers com o mesmo sinal__
> 
> Resultado tem sinal Positivo e é efetuada a multiplicação do valor absoluto do BigNumber
> 
> `mulBN (Positive[3])(Positive[3]) = Positive[9]`
> 
> `mulBN (Negative[3])(Negative[3]) = Positive[9]`
> 
> __1. Multiplicação de BigNumbers com o mesmo sinal__
> 
> Resultado tem sinal Positivo e é efetuada a multiplicação do valor absoluto do BigNumber
> 
>  `mulBN (Positive[3])(Negative[3]) = Negative[9]`
>  
>  `mulBN (Negative[3])(Positive[3]) = Negative[9]`

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
